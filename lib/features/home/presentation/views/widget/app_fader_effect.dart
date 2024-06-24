import 'package:flutter/material.dart';


class AppFaderEffect extends StatelessWidget {
  const AppFaderEffect({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, 
      height: 100,
      decoration: const BoxDecoration(gradient: LinearGradient(
        end: Alignment.topCenter,
        begin: Alignment.bottomCenter,
        colors:Colors.primaries)),
    );
  }
}