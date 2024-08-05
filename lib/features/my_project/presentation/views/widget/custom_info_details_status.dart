import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/utils/size_config.dart';
import '../../../../../core/widget/custom_body_medium.dart';
import '../../../../../core/widget/custom_label.dart';
import '../../../../../core/widget/custom_subtitle_medium.dart';
import '../../../../../core/widget/space.dart';

class CustomInfoDetailsStatus extends StatelessWidget {
  const CustomInfoDetailsStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: SizeConfig.defaultSize! * .5),
      padding: EdgeInsets.all(SizeConfig.defaultSize! * 1),
      decoration: BoxDecoration(
        color: Theme.of(context).hintColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(SizeConfig.defaultSize! * 4),
          topRight: Radius.circular(SizeConfig.defaultSize! * 4),
        ),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: SizeConfig.defaultSize! * .5),
                child: CircleAvatar(
                  radius: SizeConfig.defaultSize! * 5,
                  backgroundImage: const AssetImage(
                    "assets/images/pro.jpg",
                  ),
                ),
              ),
              const HorizintalSpace(.5),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomSubTitleMedium(
                    text: "أحمد مراد",
                    color: Colors.white,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(right: SizeConfig.defaultSize! * .5),
                    child: const CustomBody(
                      text: "مطور تطبيقات موبايل",
                      color: Colors.white,
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(right: SizeConfig.defaultSize! * .5),
                    child: const CustomBody(
                      text: "13 مشروع مكتمل",
                      color: Colors.white,
                    ),
                  ),
                  const VirticalSpace(0.2),
                  const Row(
                    children: [
                      CustomLabel(
                        text: "4.6",
                        color: Colors.white,
                      ),
                      HorizintalSpace(0.5),
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: 20,
                      ),
                    ],
                  ),
                ],
              ),
              const HorizintalSpace(9),
              IconButton(
                  onPressed: () {
                    // GoRouter.of(context).push("/editproject");
                  },
                  icon: const Icon(
                    Icons.edit,
                    color: Colors.white,
                  ))
            ],
          )
        ],
      ),
    );
  }
}
