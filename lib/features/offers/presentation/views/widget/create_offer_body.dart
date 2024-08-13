import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelance_job_portal/core/utils/size_config.dart';
import 'package:freelance_job_portal/core/widget/custom_button_general.dart';
import 'package:freelance_job_portal/core/widget/custom_meony_general.dart';
import 'package:freelance_job_portal/core/widget/custom_sub_title.dart';
import 'package:freelance_job_portal/core/widget/custom_text_form_general.dart';
import 'package:freelance_job_portal/core/widget/space.dart';
import 'package:freelance_job_portal/features/offers/presentation/view_models/bloc/offer_bloc.dart';
import 'package:freelance_job_portal/features/profile/data/models/profile/worker_Profile/worker_profile.dart';
import 'package:freelance_job_portal/features/projects/data/model/project_model/project_model.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/widget/custom_time_general.dart';
import '../../../../profile/worker profile/widgets/worker_custom_profile_card.dart';

class CreateOfferBody extends StatefulWidget {
  const CreateOfferBody(
      {super.key, required this.projectModel, required this.workerProfiles});
  final ProjectModel projectModel;
  final List<WorkerProfile> workerProfiles;

  @override
  State<CreateOfferBody> createState() => _CreateOfferBodyState();
}

class _CreateOfferBodyState extends State<CreateOfferBody> {
  late WorkerProfile currentProfile;
  @override
  void initState() {
    currentProfile = widget.workerProfiles[0];
    super.initState();
  }

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
          widget.projectModel.offerCount++;
          GoRouter.of(context).pop();
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
                    InkWell(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return Container(
                                padding: EdgeInsets.only(
                                    right: SizeConfig.defaultSize! * 1,
                                    left: SizeConfig.defaultSize! * 1,
                                    top: SizeConfig.defaultSize! * 1,
                                    bottom: SizeConfig.defaultSize! * 3),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SizedBox(
                                      height: SizeConfig.defaultSize! * 35,
                                      child: ListView.separated(
                                        separatorBuilder: (context, index) {
                                          return const VirticalSpace(1);
                                        },
                                        scrollDirection: Axis.vertical,
                                        itemCount: widget.workerProfiles.length,
                                        itemBuilder: (context, index) {
                                          return InkWell(
                                            onTap: () {
                                              setState(() {
                                                currentProfile = widget
                                                    .workerProfiles[index];
                                              });
                                              Navigator.pop(context);
                                            },
                                            child: WorkerCustomProfileCard(
                                              //TODO: on clicked changes current profile.
                                              profile:
                                                  widget.workerProfiles[index],
                                              icon: Icons.edit,
                                              onPressed: () {},
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                    const Spacer(),
                                    CustomButtonGeneral(
                                        onPressed: () {
                                          GoRouter.of(context)
                                              .push("/createWorkerProfile");
                                        },
                                        color: Theme.of(context).primaryColor,
                                        textcolor: Colors.white,
                                        text: "Add New Profile",
                                        borderSide: const BorderSide(),
                                        width: SizeConfig.defaultSize! * 40)
                                  ],
                                ),
                              );
                            },
                          );
                        },
                        child: WorkerCustomProfileCard(
                          profile: currentProfile,
                          icon: Icons.edit,
                          onPressed: () {},
                        )),
                    const VirticalSpace(7),
                    CustomTextFormGeneral(
                        mycontroller: descriptionController,
                        onTapicon: () {},
                        hinttext: "",
                        lable: "ادخل الرسالة",
                        isNumber: false),
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
                    const VirticalSpace(29),
                    Center(
                      child: CustomButtonGeneral(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              final offerData = {
                                'message': descriptionController.text,
                                'cost': int.parse(priceController.text),
                                'deliveryTime':
                                    int.parse(deliveryTimeController.text),
                                "workerId":
                                    currentProfile.id, // profile card selector
                                "projectId": widget.projectModel.id
                              };
                              print("offer data: $offerData");

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
