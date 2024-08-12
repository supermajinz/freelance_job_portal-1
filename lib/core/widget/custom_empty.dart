import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CustomEmpty extends StatelessWidget {
  const CustomEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Lottie.asset('assets/lottie/empty.json'));
  }
}
