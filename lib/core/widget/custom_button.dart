import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.color,
      required this.textcolor,
      required this.text,
      required this.borderSide,
      required this.width, this.onPressed});
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
            borderRadius: BorderRadius.circular(25), side: borderSide),
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Text(
          text,
          style: TextStyle(color: textcolor, fontSize: 20),
        ),
      ),
    );
  }
}
