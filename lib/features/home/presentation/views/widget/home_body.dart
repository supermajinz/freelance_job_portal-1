import 'package:flutter/material.dart';
import 'package:freelance_job_portal/core/constants/colors.dart';
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
      margin: EdgeInsets.only(right: SizeConfig.defaultSize! * 1),
      child: ListView(
        shrinkWrap: true,
        children: [
          const VirticalSpace(2),
          Container(
              margin: EdgeInsets.only(
                  left: SizeConfig.defaultSize! * 0.5,
                  right: SizeConfig.defaultSize! * 1),
              child: const CustomSubTitle(
                text: "التصنيفات",
              )),
          const VirticalSpace(2),
          SizedBox(
            height: SizeConfig.defaultSize! * 29,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.1,
                  crossAxisSpacing: 1.5),
              scrollDirection: Axis.horizontal,
              itemCount: 8,
              itemBuilder: (context, index) {
                return const CustomCartegoryCard();
              },
            ),
          ),
          const VirticalSpace(4),
          Container(
              margin: EdgeInsets.only(
                  left: SizeConfig.defaultSize! * 1,
                  right: SizeConfig.defaultSize! * 1),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const CustomSubTitle(
                    text: "Recommended",
                  ),
                  InkWell(
                      onTap: () {},
                      child: const Text(
                        "See All",
                        style: TextStyle(fontSize: 14, color: primaryColer),
                      ))
                ],
              )),
          const VirticalSpace(1),
          SizedBox(
            height: SizeConfig.defaultSize! * 27,
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
              margin: EdgeInsets.only(
                  left: SizeConfig.defaultSize! * 0.5,
                  right: SizeConfig.defaultSize! * 1),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const CustomSubTitle(
                    text: "Most Popular",
                  ),
                  InkWell(
                      onTap: () {},
                      child: const Text(
                        "See All",
                        style: TextStyle(fontSize: 14, color: primaryColer),
                      ))
                ],
              )),
          const VirticalSpace(1),
          SizedBox(
            height: SizeConfig.defaultSize! * 27,
            child: ListView.builder(
              itemCount: 4,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return const CustomProjectCard();
              },
            ),
          ),
          const VirticalSpace(1),
        ],
      ),
    );
  }
}
