import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelance_job_portal/core/utils/size_config.dart';
import 'package:freelance_job_portal/core/widget/custom_button_general.dart';
import 'package:freelance_job_portal/core/widget/custom_meony_general.dart';
import 'package:freelance_job_portal/core/widget/custom_sub_title.dart';
import 'package:freelance_job_portal/core/widget/custom_text_form_general.dart';
import 'package:freelance_job_portal/core/widget/space.dart';
import 'package:freelance_job_portal/features/offers/presentation/view_models/bloc/offer_bloc.dart';

class CreateOfferBody extends StatefulWidget {
  const CreateOfferBody({super.key});

  @override
  State<CreateOfferBody> createState() => _CreateOfferBodyState();
}

class _CreateOfferBodyState extends State<CreateOfferBody> {
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final TextEditingController descriptionController = TextEditingController();
    final TextEditingController priceController = TextEditingController();
    final TextEditingController deliveryTimeController =
        TextEditingController();

    return BlocConsumer<OfferBloc, OfferState>(
      listener: (context, state) {
        if (state is OfferSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Offer created successfully!')),
          );
        } else if (state is OfferFaliure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content: Text('Failed to create offer: ${state.errMessage}')),
          );
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
                    vertical: SizeConfig.defaultSize! * 2),
                child: Column(
                  children: [
                    const VirticalSpace(4),
                    CustomTextFormGeneral(
                        mycontroller: descriptionController,
                        onTapicon: () {},
                        hinttext: "",
                        lable: "Description",
                        isNumber: false),
                    const VirticalSpace(3),
                    CustomTextFormGeneral(
                      hinttext: "",
                      lable: "Delivery Time",
                      isNumber: true,
                      mycontroller: deliveryTimeController,
                      obs: false,
                      onTapicon: () {},
                    ),
                    const VirticalSpace(4),
                    const CustomSubTitle(text: "Budget"),
                    const VirticalSpace(1),
                    CustomMeonyGeneral(
                      mycontroller: priceController,
                      onTapicon: () {},
                      isNumber: true,
                    ),
                    const VirticalSpace(36),
                    Center(
                      child: CustomButtonGeneral(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              final offerData = {
                                'message': descriptionController.text,
                                'cost': int.parse(priceController.text),
                                'deliveryTime':
                                    int.parse(deliveryTimeController.text),
                                "workerId": 1,
                                "projectId": 1
                              };

                              context
                                  .read<OfferBloc>()
                                  .add(CreateOffer(offerData));
                            }
                          },
                          color: Theme.of(context).primaryColor,
                          textcolor: Colors.white,
                          text: "Send",
                          borderSide: const BorderSide(),
                          width: SizeConfig.defaultSize! * 20),
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

// class CustomDate extends StatefulWidget {
//   final TextEditingController controller;

//   const CustomDate({required this.controller, super.key});

//   @override
//   State<CustomDate> createState() => _CustomDateState();
// }

// class _CustomDateState extends State<CustomDate> {
//   void _showDatePicker() async {
//     DateTime? selectedDate = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime(2000),
//       lastDate: DateTime(2025),
//     );

//     if (selectedDate != null) {
//       setState(() {
//         widget.controller.text = selectedDate.toIso8601String();
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return IconButton(
//       onPressed: _showDatePicker,
//       icon: const Icon(
//         Icons.date_range_outlined,
//         size: 35,
//       ),
//     );
//   }
// }
