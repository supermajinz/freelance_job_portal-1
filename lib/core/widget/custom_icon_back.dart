import 'package:flutter/material.dart';

class CustomIconBack extends StatelessWidget {
  const CustomIconBack({super.key, this.onPressed});
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: onPressed,
        icon: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Icon(
              Icons.arrow_back,
              size: 25,
              color: Theme.of(context).primaryColor,
            )));
  }
}
