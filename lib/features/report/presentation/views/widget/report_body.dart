import 'package:flutter/material.dart';
import 'package:freelance_job_portal/core/utils/size_config.dart';
import 'package:freelance_job_portal/core/widget/custom_button_general.dart';
import 'package:freelance_job_portal/core/widget/custom_text_form_general.dart';
import 'package:freelance_job_portal/core/widget/space.dart';

class ReportBody extends StatelessWidget {
  const ReportBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const VirticalSpace(5),
        Container(
          margin: EdgeInsets.symmetric(
              horizontal: SizeConfig.defaultSize! * 1.5,
              vertical: SizeConfig.defaultSize! * 1.5),
          child: const CustomTextFormGeneral(
              hinttext: "", lable: "Enter Your Email", isNumber: false),
        ),
        Container(
            margin: EdgeInsets.symmetric(
                horizontal: SizeConfig.defaultSize! * 1.5,
                vertical: SizeConfig.defaultSize! * 1.5),
            child: const CustomTextFormGeneral(
                hinttext: "", lable: "Subject", isNumber: false)),
        Container(
          margin: EdgeInsets.symmetric(
              horizontal: SizeConfig.defaultSize! * 1.5,
              vertical: SizeConfig.defaultSize! * 1.5),
          child: const CustomTextFormGeneral(
              hinttext: "", lable: "Descripion", isNumber: false),
        ),
        const VirticalSpace(37),
        Center(
            child: CustomButtonGeneral(
                onPressed: () {},
                color: Theme.of(context).primaryColor,
                textcolor: Colors.white,
                text: "Send",
                borderSide: const BorderSide(width: 0),
                width: SizeConfig.defaultSize! * 20))
      ],
    );
  }
}
