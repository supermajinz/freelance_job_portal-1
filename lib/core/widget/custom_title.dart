import 'package:flutter/material.dart';

class CustomTitle extends StatelessWidget {
  const CustomTitle({super.key, required this.text, this.white = false});
  final String text;
  final bool white;

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: white
            ? Theme.of(context)
                .textTheme
                .headlineLarge!
                .copyWith(color: Colors.white)
            : Theme.of(context).textTheme.headlineLarge);
  }
}
