import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:freelance_job_portal/core/utils/size_config.dart';

class CustomRating extends StatelessWidget {
  final void Function(double) onRatingUpdate;
  const CustomRating({super.key, required this.onRatingUpdate});

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      initialRating: 0,
      minRating: 0,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemPadding:
          EdgeInsets.symmetric(horizontal: SizeConfig.defaultSize! * 1),
      itemBuilder: (context, index) {
        return const Icon(Icons.star, color: Colors.amber);
      },
      onRatingUpdate: onRatingUpdate,
    );
  }
}
