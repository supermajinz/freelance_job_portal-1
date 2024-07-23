import 'package:flutter/material.dart';

class CustomSubTitleMedium extends StatelessWidget {
  const CustomSubTitleMedium(
      {super.key, required this.text, this.color = Colors.black});
  final String text;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: Theme.of(context).textTheme.titleMedium!.copyWith(color: color));
  }
}
