import 'package:flutter/material.dart';
import 'package:freelance_job_portal/core/utils/size_config.dart';

class CustomProtofolioCard extends StatelessWidget {
  const CustomProtofolioCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: SizeConfig.defaultSize!*18,
          height: SizeConfig.defaultSize!*18,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(SizeConfig.defaultSize!*1.5),
              image: const DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage("assets/images/proto1.jpg"))),
        ),
        Positioned(
          bottom: SizeConfig.defaultSize!*.5,
          child: Container(
            alignment: Alignment.center,
            width: SizeConfig.defaultSize!*18,
            height: SizeConfig.defaultSize!*3,
            child: const Text(
              "Black Hold design",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
            ),
          ),
        ),
      ],
    );
  }
}
