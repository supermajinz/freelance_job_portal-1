import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:freelance_job_portal/core/constants/colors.dart';

class CustomIndcator extends StatelessWidget {
  const CustomIndcator({super.key, required this.dotIndex});
  final double? dotIndex;
  @override
  Widget build(BuildContext context) {
    return DotsIndicator(
      decorator: DotsDecorator(
        size: const Size(12, 12),activeSize: const Size(12, 12),
          color: Colors.transparent,
          activeColor: primaryColer,
          shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
              side: const BorderSide(color: primaryColer))),
          dotsCount: 3,
          position: dotIndex!.toInt(),
    );
  }
}
