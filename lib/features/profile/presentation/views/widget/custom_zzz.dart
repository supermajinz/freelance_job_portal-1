import 'package:flutter/material.dart';
import 'package:freelance_job_portal/core/utils/size_config.dart';
import 'package:freelance_job_portal/core/widget/custom_subtitle_medium.dart';
import 'package:freelance_job_portal/core/widget/space.dart';

class CustomZzz extends StatelessWidget {
  const CustomZzz({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.defaultSize! * 3,
          vertical: SizeConfig.defaultSize! * 1.5),
      margin: EdgeInsets.only(
          left: SizeConfig.defaultSize! * 1.5,
          right: SizeConfig.defaultSize! * .5),
      height: SizeConfig.defaultSize! * 19.2,
      decoration: BoxDecoration(
          color: Colors.deepPurple,
          borderRadius: BorderRadius.circular(SizeConfig.defaultSize! * 1)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              SizedBox(
                width: SizeConfig.defaultSize! * 10.5,
                child: Text("Number of projects completed",
                    textAlign: TextAlign.center,
                    maxLines: 3,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: Colors.white)),
              ),
              const VirticalSpace(1),
              CircleAvatar(
                maxRadius: SizeConfig.defaultSize! * 3,
                backgroundColor: const Color.fromARGB(255, 69, 49, 100),
                child: const CustomSubTitleMedium(
                  text: "17",
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Column(
            children: [
              SizedBox(
                width: SizeConfig.defaultSize! * 10.5,
                child: Text(
                  "Percentage of projects delivered on deadline:",
                  textAlign: TextAlign.center,
                  maxLines: 3,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Colors.white),
                ),
              ),
              const VirticalSpace(1),
              CircleAvatar(
                maxRadius: SizeConfig.defaultSize! * 3,
                backgroundColor: const Color.fromARGB(255, 69, 49, 100),
                child: const CustomSubTitleMedium(
                  text: "86%",
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
