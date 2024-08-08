import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelance_job_portal/core/utils/functions/show_bottom_sheet_offer.dart';
import 'package:freelance_job_portal/core/utils/size_config.dart';
import 'package:freelance_job_portal/core/widget/custom_body_medium.dart';
import 'package:freelance_job_portal/core/widget/custom_button_general.dart';
import 'package:freelance_job_portal/core/widget/custom_container.dart';
import 'package:freelance_job_portal/core/widget/custom_label.dart';
import 'package:freelance_job_portal/core/widget/custom_meony.dart';
import 'package:freelance_job_portal/core/widget/custom_sub_title.dart';
import 'package:freelance_job_portal/core/widget/custom_subtitle_medium.dart';
import 'package:freelance_job_portal/core/widget/space.dart';
import 'package:freelance_job_portal/features/offers/presentation/view_models/bloc/offer_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../projects/presentation/view_models/project_bloc/project_bloc.dart';
import '../../../../projects/presentation/views/widget/custom_chip_project.dart';
import '../../../data/model/offers_model/offers_model.dart';

class OfferDetailsBody extends StatelessWidget {
  const OfferDetailsBody({super.key, required this.offer});
  final OffersModel offer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<OfferBloc, OfferState>(
        listener: (context, state) {
          if (state is OfferDeleteSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('تم حذف العرض بنجاح')),
            );
            GoRouter.of(context).pop();
          }
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              const VirticalSpace(10),
              Stack(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: SizeConfig.defaultSize! * .5),
                    decoration: BoxDecoration(
                        color: Theme.of(context).focusColor,
                        borderRadius: BorderRadius.only(
                            topLeft:
                                Radius.circular(SizeConfig.defaultSize! * 4),
                            topRight:
                                Radius.circular(SizeConfig.defaultSize! * 4))),
                    child: Padding(
                      padding: EdgeInsets.all(SizeConfig.defaultSize! * 2),
                      child: Column(
                        children: [
                          const VirticalSpace(20),
                          const CustomSubTitle(
                              text: "Excited to Work With You!"),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: SizeConfig.defaultSize! * 1),
                            child: Text(
                              offer.message!,
                              textAlign: TextAlign.center,
                              maxLines: 5,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Text(
                              "show more",
                              textAlign: TextAlign.start,
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge!
                                  .copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    decorationThickness: 2,
                                    decoration: TextDecoration.underline,
                                  ),
                            ),
                          ),
                          const VirticalSpace(4),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const CustomSubTitleMedium(text: "Price"),
                              CustomMeony(
                                text: offer.cost?.toString() ?? 'N/A',
                              )
                            ],
                          ),
                          const VirticalSpace(4),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Expanded(
                                  child: CustomSubTitleMedium(
                                      text: "Delivery Time")),
                              Expanded(
                                child: CustomContainer(
                                  text: offer.deliveryTime?.toString() ?? 'N/A',
                                ),
                              )
                            ],
                          ),
                          const VirticalSpace(11),
                          BlocListener<ProjectBloc, ProjectState>(
                            listener: (context, state) {
                              if (state is OfferAccept) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text('تم قبول العرض بنجاح')),
                                );
                              } else if (state is OfferReject) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text('تم رفض العرض بنجاح')),
                                );
                              }
                            },
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 7,
                                  child: CustomButtonGeneral(
                                      onPressed: () {
                                        showBottomSheetOffer(
                                          context,
                                          () {
                                            context
                                                .read<ProjectBloc>()
                                                .add(AcceptOffer(offer.id!));
                                          },
                                        );
                                      },
                                      color: const Color.fromARGB(
                                          255, 86, 219, 155),
                                      textcolor: Colors.white,
                                      text: "قبول العرض",
                                      borderSide: const BorderSide(width: 0),
                                      width: SizeConfig.defaultSize! * 20),
                                ),
                                const Spacer(),
                                Expanded(
                                  flex: 7,
                                  child: CustomButtonGeneral(
                                      onPressed: () {
                                        context
                                            .read<ProjectBloc>()
                                            .add(RejectOffer(offer.id!));
                                      },
                                      color: const Color.fromARGB(
                                          255, 233, 105, 105),
                                      textcolor: Colors.white,
                                      text: "رفض العرض",
                                      borderSide: const BorderSide(width: 0),
                                      width: SizeConfig.defaultSize! * 20),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: SizeConfig.defaultSize! * .5),
                    padding: EdgeInsets.all(SizeConfig.defaultSize! * 1),
                    decoration: BoxDecoration(
                        color: Theme.of(context).hintColor,
                        borderRadius: BorderRadius.only(
                            topLeft:
                                Radius.circular(SizeConfig.defaultSize! * 4),
                            topRight:
                                Radius.circular(SizeConfig.defaultSize! * 4))),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: CircleAvatar(
                                radius: SizeConfig.defaultSize! * 5,
                                backgroundImage: const AssetImage(
                                  "assets/images/pro.jpg",
                                ),
                              ),
                            ),
                            const HorizintalSpace(1.5),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomSubTitleMedium(
                                  text:
                                      "${offer.worker?.userDto?.firstname ?? 'Unknown'} ${offer.worker?.userDto?.lastname ?? ''}",
                                  color: Colors.white,
                                ),
                                CustomBody(
                                  text: offer.worker!.jobTitleDto!.title!,
                                  color: Colors.white,
                                ),
                                const CustomBody(
                                  text: "13 مشروع مكتمل",
                                  color: Colors.white,
                                ),
                                const VirticalSpace(0.2),
                                Row(
                                  children: [
                                    CustomLabel(
                                      text: offer.worker!.rate.toString(),
                                      color: Colors.white,
                                    ),
                                    const HorizintalSpace(0.5),
                                    const Icon(
                                      Icons.star,
                                      color: Colors.yellow,
                                      size: 20,
                                    )
                                  ],
                                )
                              ],
                            ),
                            const Spacer(),
                            PopupMenuButton(
                              position: PopupMenuPosition.under,
                              constraints: const BoxConstraints(maxHeight: 150),
                              elevation: 10,
                              iconColor: Colors.white,
                              iconSize: 25,
                              onSelected: (value) {
                                if (value == 'edit') {
                                  GoRouter.of(context)
                                      .push("/editoffer", extra: offer);
                                } else if (value == 'delete') {
                                  context
                                      .read<OfferBloc>()
                                      .add(DeleteOffer(offer.id!));
                                }
                              },
                              itemBuilder: (context) => [
                                const PopupMenuItem(
                                    value: 'edit',
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Icon(Icons.edit),
                                        CustomBody(
                                          text: "تعديل العرض",
                                        ),
                                      ],
                                    )),
                                const PopupMenuItem(
                                    value: "delete",
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Icon(
                                          Icons.delete,
                                          color: Colors.red,
                                        ),
                                        CustomBody(
                                          text: "حذف العرض",
                                          color: Colors.red,
                                        ),
                                      ],
                                    )),
                              ],
                            ),
                          ],
                        ),
                        const VirticalSpace(2),
                        Wrap(
                          spacing: SizeConfig.defaultSize! * 1,
                          runSpacing: SizeConfig.defaultSize! * .5,
                          children: [
                            for (var skill in offer.worker!.skillDtOs ?? [])
                              CustomChipProject(
                                  text: skill.name ?? 'Unknown Skill'),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
