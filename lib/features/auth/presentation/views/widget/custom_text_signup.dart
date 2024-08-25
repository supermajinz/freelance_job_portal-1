import 'package:flutter/material.dart';

class TextSignUp extends StatelessWidget {
  final String text1;
  final String text2;
  final void Function()? onTap;
  const TextSignUp(
      {super.key,
      required this.text1,
      required this.text2,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text1,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        InkWell(
          onTap: onTap,
          child: Text(
            text2,
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: Theme.of(context).colorScheme.secondary,fontWeight: FontWeight.w800),
          ),
        )
      ],
    );
  }
}
