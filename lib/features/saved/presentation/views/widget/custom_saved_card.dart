import 'package:flutter/material.dart';
import 'package:freelance_job_portal/core/utils/size_config.dart';
import 'package:freelance_job_portal/core/widget/custom_body_medium.dart';
import 'package:freelance_job_portal/core/widget/custom_label.dart';
import 'package:freelance_job_portal/core/widget/custom_subtitle_medium.dart';
import 'package:freelance_job_portal/core/widget/space.dart';

class CustomSavedCard extends StatelessWidget {
  const CustomSavedCard({super.key, this.icon, this.onPressed});
  final IconData? icon;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          top: SizeConfig.defaultSize! * .8,
          bottom: SizeConfig.defaultSize! * .8),
      height: SizeConfig.defaultSize! * 12,
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColorLight,
          borderRadius:
              BorderRadius.all(Radius.circular(SizeConfig.defaultSize! * 1.5))),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: SizeConfig.defaultSize! * 6.5,
            backgroundImage: const AssetImage(
              "assets/images/pro.jpg",
            ),
          ),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomSubTitleMedium(
                text: "أحمد مراد",
              ),
              VirticalSpace(.5),
              CustomBody(
                text: "مطور تطبيقات موبايل",
              ),
              VirticalSpace(0.2),
              Row(
                children: [
                  CustomLabel(
                    text: "4.6",
                    color: Colors.black,
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
              onPressed: onPressed,
              icon: Icon(
                icon,
                size: 25,
                color: Colors.black,
              ))
        ],
      ),
    );
  }
}
