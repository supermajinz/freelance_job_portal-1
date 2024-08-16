import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelance_job_portal/core/utils/size_config.dart';
import 'package:freelance_job_portal/core/widget/custom_button_general.dart';
import 'package:freelance_job_portal/core/widget/custom_sub_title.dart';
import 'package:freelance_job_portal/core/widget/space.dart';
import 'package:freelance_job_portal/features/offers/data/model/offers_model/offers_model.dart';
import 'package:freelance_job_portal/features/offers/presentation/view_models/bloc/offer_bloc.dart';
import 'package:freelance_job_portal/features/profile/presentation/views/widget/edit_text_form.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/widget/custom_meony_general.dart';
import '../../../../../core/widget/custom_time_general.dart';

class EditOfferBody extends StatefulWidget {
  final OffersModel offer;
  const EditOfferBody({super.key, required this.offer});

  @override
  // ignore: library_private_types_in_public_api
  _EditOfferBodyState createState() => _EditOfferBodyState();
}

class _EditOfferBodyState extends State<EditOfferBody> {
  final formKey = GlobalKey<FormState>();
  late final TextEditingController descriptionController;
  late final TextEditingController priceController;
  late final TextEditingController deliveryTimeController;
//
  @override
  void initState() {
    descriptionController = TextEditingController(text: widget.offer.message);
    priceController =
        TextEditingController(text: widget.offer.cost?.toString());
    deliveryTimeController =
        TextEditingController(text: widget.offer.deliveryTime?.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OfferBloc, OfferState>(
      listener: (context, state) {
        if (state is OfferLoading) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('جاري تعديل العرض')),
          );
        } else if (state is OfferFaliure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content: Text('Failed to load offer: ${state.errMessage}')),
          );
        } else if (state is OfferSuccess) {
          ScaffoldMessenger.of(context).clearSnackBars();
          ScaffoldMessenger.of(context)
              .showSnackBar(
                const SnackBar(content: Text('تم تعديل العرض بنجاح')),
              )
              .closed
              .then((_) {
            GoRouter.of(context).pop();
          });
        }
      },
      builder: (context, state) {
        return Form(
          key: formKey,
          child: ListView(
            children: [
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: SizeConfig.defaultSize! * 1.5,
                  vertical: SizeConfig.defaultSize! * 3,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    EditTextForm(
                      mycontroller: descriptionController,
                      hinttext: "",
                      lable: "ادخل الرسالة الجديدة",
                      isNumber: false,
                    ),
                    const VirticalSpace(5),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              const CustomSubTitle(text: "زمن التسليم"),
                              const VirticalSpace(1),
                              CustomTimeGeneral(
                                mycontroller: deliveryTimeController,
                                onTapicon: () {},
                                isNumber: true,
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              const CustomSubTitle(text: "السعر"),
                              const VirticalSpace(1),
                              CustomMeonyGeneral(
                                mycontroller: priceController,
                                onTapicon: () {},
                                isNumber: true,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    const VirticalSpace(35),
                    CustomButtonGeneral(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          final offerData = {
                            'message': descriptionController.text,
                            'cost': int.parse(priceController.text),
                            'deliveryTime':
                                int.parse(deliveryTimeController.text),
                          };
                          context.read<OfferBloc>().add(UpdateOffer(
                              widget.offer.id!, offerData, widget.offer));
                        }
                      },
                      color: Theme.of(context).primaryColor,
                      textcolor: Colors.white,
                      text: "حفظ التعديل",
                      borderSide: const BorderSide(),
                      width: SizeConfig.defaultSize! * 20,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
