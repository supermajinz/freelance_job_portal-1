import 'package:flutter/material.dart';


class CustomBody extends StatelessWidget {
  const CustomBody({super.key, required this.text, this.color = Colors.black, this.textStyle});
  final String text;
  final Color color;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: TextOverflow.ellipsis,
      maxLines: 2,
      style: textStyle?.copyWith(color: color) ?? Theme.of(context).textTheme.bodyLarge!.copyWith(color: color),
    );
  }
}
