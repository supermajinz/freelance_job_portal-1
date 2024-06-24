import 'package:flutter/material.dart';

class CustomTitle extends StatelessWidget {
  const CustomTitle({super.key, required this.size, required this.text, required this.color});
  final double size;
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(text,style: TextStyle(fontSize: size,color: color),);
  }
}
