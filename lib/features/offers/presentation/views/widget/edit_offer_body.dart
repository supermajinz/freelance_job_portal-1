import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelance_job_portal/core/utils/size_config.dart';
import 'package:freelance_job_portal/core/widget/custom_button_general.dart';
import 'package:freelance_job_portal/core/widget/custom_edit_meony_general.dart';
import 'package:freelance_job_portal/core/widget/custom_sub_title.dart';
import 'package:freelance_job_portal/core/widget/space.dart';
import 'package:freelance_job_portal/features/offers/data/model/offers_model/offers_model.dart';
import 'package:freelance_job_portal/features/offers/presentation/view_models/bloc/offer_bloc.dart';
import 'package:freelance_job_portal/features/profile/presentation/views/widget/edit_text_form.dart';
import 'package:go_router/go_router.dart';

class EditOfferBody extends StatefulWidget {
  final OffersModel offer;
  const EditOfferBody({super.key, required this.offer});

  @override
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
            const SnackBar(content: Text('Offer is updating')),
          );
        } else if (state is OfferFaliure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content: Text('Failed to load offer: ${state.errMessage}')),
          );
        } else if (state is OfferSuccess) {
          ScaffoldMessenger.of(context).clearSnackBars();
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Offer updated successfully!')),
          );
          GoRouter.of(context).pop();
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
                  vertical: SizeConfig.defaultSize! * 2,
                ),
                child: Column(
                  children: [
                    const VirticalSpace(4),
                    EditTextForm(
                      mycontroller: descriptionController,
                      hinttext: "",
                      lable: "Description",
                      isNumber: false,
                    ),
                    const VirticalSpace(3),
                    EditTextForm(
                      mycontroller: deliveryTimeController,
                      hinttext: "",
                      lable: "Delivery Time",
                      isNumber: true,
                    ),
                    const VirticalSpace(4),
                    const CustomSubTitle(text: "Budget"),
                    const VirticalSpace(1),
                    CustomEditMeonyGeneral(
                      mycontroller: priceController,
                      isNumber: true,
                    ),
                    const VirticalSpace(36),
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
                      text: "Save",
                      borderSide: const BorderSide(),
                      width: SizeConfig.defaultSize! * 20,
                    ),
                    const VirticalSpace(3),
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
