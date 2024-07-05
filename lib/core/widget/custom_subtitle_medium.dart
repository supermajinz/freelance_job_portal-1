import 'package:flutter/material.dart';

class CustomSubTitleMedium extends StatelessWidget {
  const CustomSubTitleMedium({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text, style: Theme.of(context).textTheme.titleMedium);
  }
}
