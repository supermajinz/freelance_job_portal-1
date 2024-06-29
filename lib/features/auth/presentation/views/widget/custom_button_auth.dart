import 'package:flutter/material.dart';
import 'package:freelance_job_portal/core/utils/size_config.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.color,
      required this.textcolor,
      required this.text,
      required this.borderSide,
      required this.width,
      this.onPressed});
  final Color color;
  final Color textcolor;
  final String text;
  final BorderSide borderSide;
  final double width;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: width),
      child: MaterialButton(
        onPressed: onPressed,
        color: color,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(SizeConfig.defaultSize! * 5),
            side: borderSide),
        padding: EdgeInsets.symmetric(vertical: SizeConfig.defaultSize! * .9),
        child: Text(
          text,
          style: TextStyle(
              color: textcolor, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
