import 'package:flutter/material.dart';
import 'package:freelance_job_portal/core/utils/size_config.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({super.key, required this.disc, required this.image});
  final String disc;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          image,
          height: SizeConfig.defaultSize! * 45,
          width: SizeConfig.defaultSize! * 50,
          fit: BoxFit.fill,
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.defaultSize! * 2,
              vertical: SizeConfig.defaultSize! * 4),
          child: Text(
            disc,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 18, color: Colors.grey),
          ),
        )
      ],
    );
  }
}
