import 'package:flutter/material.dart';
import 'package:freelance_job_portal/core/widget/custom_sub_title.dart';
import 'package:freelance_job_portal/core/widget/space.dart';
import 'package:freelance_job_portal/features/home/presentation/views/widget/custom_cartegory_card.dart';
import 'package:freelance_job_portal/features/home/presentation/views/widget/custom_project_card.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        const VirticalSpace(2),
        Container(
            margin: const EdgeInsets.only(left: 10),
            child: const CustomSubTitle(
              text: "Categories",
            )),
        const VirticalSpace(1),
        SizedBox(height: 300,
          child: GridView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 6,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,crossAxisSpacing: 10,mainAxisSpacing: 10), itemBuilder: (context, index) {
            return const CustomCartegoryCard();
          },),
        ),
         const VirticalSpace(3),
        Container(
            margin: const EdgeInsets.only(left: 10),
            child: const CustomSubTitle(
              text: "Recommended",
            )),
        const VirticalSpace(1),
        SizedBox(
          height: 270,
          child: ListView.builder(
            itemCount: 4,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return const CustomProjectCard();
            },
          ),
        ),
        const VirticalSpace(3),
        Container(
            margin: const EdgeInsets.only(left: 10),
            child: const CustomSubTitle(
              text: "Most Popular",
            )),
        const VirticalSpace(1),
        SizedBox(
          height: 270,
          child: ListView.builder(
            itemCount: 4,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return const CustomProjectCard();
            },
          ),
        ),
      ],
    );
  }
}
