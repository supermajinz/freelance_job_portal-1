import 'package:flutter/material.dart';
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
import 'package:freelance_job_portal/features/profile/presentation/views/widget/show_chip.dart';
import 'package:go_router/go_router.dart';

class OfferDetailsBody extends StatelessWidget {
  const OfferDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const VirticalSpace(3),
            Stack(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: SizeConfig.defaultSize! * .5),
                  decoration: BoxDecoration(
                      color: Theme.of(context).focusColor,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(SizeConfig.defaultSize! * 4),
                          topRight:
                              Radius.circular(SizeConfig.defaultSize! * 4))),
                  child: Padding(
                    padding: EdgeInsets.all(SizeConfig.defaultSize! * 2),
                    child: Column(
                      children: [
                        const VirticalSpace(20),
                        const CustomSubTitle(text: "Excited to Work With You!"),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: SizeConfig.defaultSize! * 1),
                          child: Text(
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce fermentum lacus metus. Vivamus faucibus ullamcorper velit, id facilisis lacus tempus",
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
                        const Row(
                          children: [
                            Expanded(
                                child: CustomSubTitleMedium(text: "Price")),
                            Expanded(
                                child: CustomMeony(
                              text: "7,500,000",
                            ))
                          ],
                        ),
                        const VirticalSpace(4),
                        const Row(
                          children: [
                            Expanded(
                                child: CustomSubTitleMedium(
                                    text: "Delivery Time")),
                            Expanded(
                                child: CustomContainer(
                              text: "12/4/2024",
                            ))
                          ],
                        ),
                        const VirticalSpace(11),
                        CustomButtonGeneral(
                            onPressed: () {
                              showBottomSheetOffer(context);
                            },
                            color: Colors.white,
                            textcolor: Colors.black,
                            text: "Accept Offer",
                            borderSide:
                                const BorderSide(width: 1, color: Colors.grey),
                            width: SizeConfig.defaultSize! * 20)
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
                          topLeft: Radius.circular(SizeConfig.defaultSize! * 4),
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
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomSubTitleMedium(
                                text: "أحمد مراد",
                                color: Colors.white,
                              ),
                              CustomBody(
                                text: "مطور تطبيقات موبايل",
                                color: Colors.white,
                              ),
                              CustomBody(
                                text: "13 مشروع مكتمل",
                                color: Colors.white,
                              ),
                              VirticalSpace(0.2),
                              Row(
                                children: [
                                  CustomLabel(
                                    text: "4.6",
                                    color: Colors.white,
                                  ),
                                  HorizintalSpace(0.5),
                                  Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                    size: 20,
                                  )
                                ],
                              )
                            ],
                          ),
                          const HorizintalSpace(8),
                          IconButton(
                              onPressed: () {
                                GoRouter.of(context).push('/editoffer');
                              },
                              icon: const Icon(
                                Icons.edit,
                                size: 25,
                                color: Colors.white,
                              ))
                        ],
                      ),
                      const VirticalSpace(2),
                      const ShowChip()
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
