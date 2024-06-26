import 'package:flutter/material.dart';
import 'package:freelance_job_portal/core/utils/size_config.dart';
import 'package:freelance_job_portal/core/widget/custom_sub_title.dart';
import 'package:freelance_job_portal/core/widget/space.dart';
import 'package:freelance_job_portal/features/home/presentation/views/widget/custom_cartegory_card.dart';
import 'package:freelance_job_portal/features/home/presentation/views/widget/custom_project_card.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: SizeConfig.defaultSize! * 1),
      child: ListView(
        shrinkWrap: true,
        children: [
          const VirticalSpace(2),
          Container(
              margin: EdgeInsets.only(left: SizeConfig.defaultSize! * 0.5),
              child: const CustomSubTitle(
                text: "Categories",
              )),
          const VirticalSpace(2),
          SizedBox(
            height: SizeConfig.defaultSize!*14,
            child: ListView.separated(
              separatorBuilder: (context, index) {
                return const HorizintalSpace(1);
              },
              scrollDirection: Axis.horizontal,
              itemCount: 6,
              itemBuilder: (context, index) {
                return const CustomCartegoryCard();
              },
            ),
          ),
          
          Container(
              margin: EdgeInsets.only(left: SizeConfig.defaultSize! * 0.5),
              child: const CustomSubTitle(
                text: "Recommended",
              )),
          const VirticalSpace(1),
          SizedBox(
            height: SizeConfig.defaultSize!*27,
            child: ListView.builder(
              itemCount: 4,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return const CustomProjectCard();
              },
            ),
          ),
          const VirticalSpace(4),
          Container(
              margin: EdgeInsets.only(left: SizeConfig.defaultSize! * 0.5),
              child: const CustomSubTitle(
                text: "Most Popular",
              )),
          const VirticalSpace(1),
          SizedBox(
            height: SizeConfig.defaultSize!*27,
            child: ListView.builder(
              itemCount: 4,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return const CustomProjectCard();
              },
            ),
          ),
        ],
      ),
    );
  }
}
