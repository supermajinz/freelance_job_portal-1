import 'package:flutter/material.dart';

class CustomSubTitle extends StatelessWidget {
  const CustomSubTitle({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text,style: const TextStyle(fontWeight: FontWeight.w400,fontSize: 22),);
  }
}
