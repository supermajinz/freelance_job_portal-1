import 'package:flutter/material.dart';
import 'package:freelance_job_portal/core/utils/size_config.dart';
import 'package:freelance_job_portal/core/widget/custom_body_medium.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: SizeConfig.defaultSize! * 5,
      width: SizeConfig.defaultSize! * 5,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(width: 1, color: Theme.of(context).primaryColor),
          borderRadius: BorderRadius.circular(SizeConfig.defaultSize! * 10)),
      child: CustomBody(
        text: text,
      ),
    );
  }
}
