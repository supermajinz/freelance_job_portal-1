import 'package:flutter/material.dart';
import 'package:freelance_job_portal/core/utils/size_config.dart';
import 'package:lottie/lottie.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({super.key, required this.disc, required this.image});
  final String disc;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Lottie.asset(
          image,
          height: SizeConfig.defaultSize! * 50,
          width: double.infinity,
          fit: BoxFit.fill,
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.defaultSize! * 2,
              vertical: SizeConfig.defaultSize! * 4),
          child: Text(disc,
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: Colors.grey)),
        )
      ],
    );
  }
}
