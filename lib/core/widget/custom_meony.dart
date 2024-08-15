import 'package:flutter/material.dart';
import 'package:freelance_job_portal/core/utils/size_config.dart';
import 'package:freelance_job_portal/core/widget/custom_money_body.dart';
import 'package:freelance_job_portal/core/widget/custom_subtitle_medium.dart';

class CustomMeony extends StatelessWidget {
  const CustomMeony({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding:
              EdgeInsets.symmetric(horizontal: SizeConfig.defaultSize! * 1),
          alignment: Alignment.center,
          height: SizeConfig.defaultSize! * 5,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(SizeConfig.defaultSize! * 10),
                  topRight: Radius.circular(SizeConfig.defaultSize! * 10)),
              color: Theme.of(context).primaryColor),
          child: const CustomSubTitleMedium(
            text: "ل.س",
            color: Colors.white,
          ),
        ),
        Container(
          padding:
              EdgeInsets.symmetric(horizontal: SizeConfig.defaultSize! * 1),
          alignment: Alignment.center,
          height: SizeConfig.defaultSize! * 5,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(width: 1, color: Theme.of(context).primaryColor),
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(SizeConfig.defaultSize! * 10),
                topLeft: Radius.circular(SizeConfig.defaultSize! * 10)),
          ),
          child: CustomMoneyBody(
            text: text,
          ),
        ),
      ],
    );
  }
}
