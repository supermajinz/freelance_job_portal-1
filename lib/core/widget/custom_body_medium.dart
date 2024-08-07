import 'package:flutter/material.dart';

class CustomBody extends StatelessWidget {
  const CustomBody({super.key, required this.text, this.color = Colors.black});
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: TextOverflow.ellipsis,
      maxLines: 2,
      style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: color),
    );
  }
}
