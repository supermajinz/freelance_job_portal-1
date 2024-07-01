import 'package:flutter/material.dart';
import 'package:freelance_job_portal/core/utils/size_config.dart';
//import 'package:flutter_svg/flutter_svg.dart';
import 'package:freelance_job_portal/core/widget/space.dart';

class CustomCartegoryCard extends StatelessWidget {
  const CustomCartegoryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(SizeConfig.defaultSize! * 0.5),
          height: SizeConfig.defaultSize! * 8,
          width: SizeConfig.defaultSize! * 8,
          decoration: BoxDecoration(
            color: Colors.deepPurpleAccent,
            borderRadius:
                BorderRadius.all(Radius.circular(SizeConfig.defaultSize! * 1)),
          ),
          child: Image.asset("assets/images/ux.png",
              height: SizeConfig.defaultSize! * 6,
              width: SizeConfig.defaultSize! * 6,
              fit: BoxFit.fill),
        ),
        const VirticalSpace(1),
        SizedBox(
          width: SizeConfig.defaultSize! * 10,
          child: const Text(
            "Programming",
            maxLines: 2,
            style: TextStyle(
                color: Color.fromARGB(255, 58, 33, 102),
                fontWeight: FontWeight.w300,
                fontSize: 15),
          ),
        ),
      ],
    );
  }
}
