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
          width: SizeConfig.defaultSize! * 17.5,
          height: SizeConfig.defaultSize! * 17.5,
          decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.circular(SizeConfig.defaultSize! * 1.5),
              image: const DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage("assets/images/proto3.jpg"))),
        ),
        Positioned(
          bottom: SizeConfig.defaultSize! * .0,
          right: SizeConfig.defaultSize! * .0,
          left: SizeConfig.defaultSize! * .0,
          child: Container(
            width: SizeConfig.defaultSize! * 17.5,
            height: SizeConfig.defaultSize! * 3,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Theme.of(context).hintColor,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(SizeConfig.defaultSize! * 1.5),
                    bottomRight:
                        Radius.circular(SizeConfig.defaultSize! * 1.5))),
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
