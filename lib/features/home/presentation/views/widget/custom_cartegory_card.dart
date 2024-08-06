import 'package:flutter/material.dart';
import 'package:freelance_job_portal/core/utils/size_config.dart';
//import 'package:flutter_svg/flutter_svg.dart';
import 'package:freelance_job_portal/core/widget/space.dart';
import 'package:freelance_job_portal/features/home/data/model/caregories/caregories.dart';

class CustomCartegoryCard extends StatelessWidget {
  const CustomCartegoryCard({super.key, required this.cat});
  final Categories cat;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(SizeConfig.defaultSize! * 0.7),
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
          width: SizeConfig.defaultSize! * 12,
          child: Text(
            cat.name,
            textAlign: TextAlign.center,
            maxLines: 3,
            style: Theme.of(context).textTheme.labelLarge,
          ),
        ),
      ],
    );
  }
}
