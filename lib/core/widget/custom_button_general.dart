import 'package:flutter/material.dart';
import 'package:freelance_job_portal/core/utils/size_config.dart';
import 'package:freelance_job_portal/core/widget/custom_subtitle_medium.dart';

class CustomButtonGeneral extends StatelessWidget {
  const CustomButtonGeneral(
      {super.key,
      required this.color,
      required this.textcolor,
      required this.text,
      required this.borderSide,
      required this.width,
      this.icon,
      this.onPressed});
  final Color color;
  final Color textcolor;
  final String text;
  final BorderSide borderSide;
  final double width;
  final void Function()? onPressed;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: MaterialButton(
          onPressed: onPressed,
          color: color,
          shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(SizeConfig.defaultSize! * 2.5),
              side: borderSide),
          padding: EdgeInsets.symmetric(vertical: SizeConfig.defaultSize! * .8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null) ...[
                icon!, // هنا تظهر الأيقونة على اليسار
                SizedBox(
                    width:
                        SizeConfig.defaultSize!), // المسافة بين الأيقونة والنص
              ],
              CustomSubTitleMedium(
                text: text,
                color: textcolor,
              ),
            ],
          )),
    );
  }
}
