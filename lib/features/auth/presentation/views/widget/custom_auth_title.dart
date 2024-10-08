import 'package:flutter/material.dart';

class CustomAuthTitle extends StatelessWidget {
  const CustomAuthTitle({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: Theme.of(context)
            .textTheme
            .headlineMedium!
            .copyWith(color: Theme.of(context).colorScheme.secondary));
  }
}
