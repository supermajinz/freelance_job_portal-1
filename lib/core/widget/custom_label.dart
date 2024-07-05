import 'package:flutter/material.dart';

class CustomLabel extends StatelessWidget {
  const CustomLabel(
      {super.key,
      required this.text,
      this.color = const Color.fromARGB(255, 82, 82, 82)});
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.labelLarge!.copyWith(color: color),
    );
  }
}
