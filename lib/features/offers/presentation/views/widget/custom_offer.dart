import 'package:flutter/material.dart';
import 'package:freelance_job_portal/core/widget/custom_body_medium.dart';
import 'package:freelance_job_portal/core/widget/custom_label.dart';
import 'package:freelance_job_portal/core/widget/space.dart';
import '../../../../../core/utils/size_config.dart';
import '../../../../../core/widget/custom_subtitle_medium.dart';
import '../../../data/model/offers_model/offers_model.dart';

class CustomOffer extends StatelessWidget {
  const CustomOffer({super.key, required this.offer});

  final OffersModel offer;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.defaultSize! * 21,
      padding: EdgeInsets.all(SizeConfig.defaultSize! * 1),
      decoration: BoxDecoration(
        color: Theme.of(context).unselectedWidgetColor,
        borderRadius: BorderRadius.circular(SizeConfig.defaultSize! * 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: SizeConfig.defaultSize! * .5),
                child: CircleAvatar(
                  radius: SizeConfig.defaultSize! * 4,
                  backgroundImage: const AssetImage(
                    "assets/images/pro.jpg",
                  ),
                ),
              ),
              const HorizintalSpace(.5),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomSubTitleMedium(
                    text:
                        "${offer.worker!.userDto!.firstname} ${offer.worker!.userDto!.lastname}",
                    color: Colors.white,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(right: SizeConfig.defaultSize! * .5),
                    child: CustomBody(
                      text: offer.worker!.jobTitleDto!.title!,
                      color: Colors.white,
                    ),
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
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: SizeConfig.defaultSize! * .5),
                child: const HorizintalSpace(10),
              ),
              const CustomLabel(
                text: "1d",
                color: Colors.white,
              ),
            ],
          ),
          const VirticalSpace(1),
          CustomBody(
            text: offer.message!,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
