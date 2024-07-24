import 'package:flutter/material.dart';
import 'package:freelance_job_portal/core/widget/custom_body_medium.dart';
import 'package:freelance_job_portal/core/widget/custom_label.dart';
import 'package:freelance_job_portal/core/widget/space.dart';
import '../../../../../core/utils/size_config.dart';
import '../../../../../core/widget/custom_subtitle_medium.dart';

class CustomOffer extends StatelessWidget {
  const CustomOffer({super.key});

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
                  const CustomSubTitleMedium(
                    text: "أحمد مراد",
                    color: Colors.white,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(right: SizeConfig.defaultSize! * .5),
                    child: const CustomBody(
                      text: "مطور تطبيقات موبايل",
                      color: Colors.white,
                    ),
                  ),
                  const VirticalSpace(0.2),
                  const Row(
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
          const CustomSubTitleMedium(
            text: "Excited to work with you!",
            color: Colors.white,
          ),
          const VirticalSpace(.5),
          const CustomBody(
            text:
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce fermentum lacus metus. Vivamus faucibus ullamcorper velit, id facilisis lacus tempus.",
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
