import 'package:flutter/material.dart';
import 'package:freelance_job_portal/core/utils/size_config.dart';
import 'package:freelance_job_portal/core/widget/custom_body_medium.dart';
import 'package:freelance_job_portal/core/widget/custom_label.dart';
import 'package:freelance_job_portal/core/widget/custom_subtitle_medium.dart';
import 'package:freelance_job_portal/core/widget/space.dart';
import 'package:freelance_job_portal/features/home/presentation/views/widget/custom_choice_chip.dart';
import 'package:freelance_job_portal/features/projects/data/model/project_model/project_model.dart';

class CustomProjectCard extends StatelessWidget {
  const CustomProjectCard({super.key, required this.project});
  final ProjectModel project;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: SizeConfig.defaultSize! * 1.2 / SizeConfig.defaultSize! * 1,
      child: Card(
          child: Container(
        padding: EdgeInsets.only(top: SizeConfig.defaultSize! * 0.2),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(right: SizeConfig.defaultSize! * 1.2),
                child: Row(
                  children: [
                    const CustomSubTitleMedium(text: 'برنامج إدارة طلبات'),
                    const Spacer(),
                    const CustomLabel(
                      text: '1d',
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.bookmark_add_outlined))
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: SizeConfig.defaultSize! * 1.2),
                child: const CustomBody(
                    text:
                        'نريد برنامج كامل لمتابعة الطلبات من أجل شركتنا يرجى التقدم فقط إن كنت تريد العمل ضمن دمشق'),
              ),
              const VirticalSpace(1),
              Padding(
                padding: EdgeInsets.only(right: SizeConfig.defaultSize! * 1.2),
                child: SizedBox(
                  height: SizeConfig.defaultSize! * 4,
                  child: ListView.separated(
                    separatorBuilder: (context, index) {
                      return const HorizintalSpace(.5);
                    },
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return CustomChoiceChip(
                        text: "Laravel",
                        color: Theme.of(context).focusColor,
                      );
                    },
                  ),
                ),
              ),
              const VirticalSpace(1),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomBody(
                    text: '١٠ مليون ل.س',
                    color: Colors.green,
                  ),
                  CustomBody(
                    text: '٣ شهور',
                    color: Colors.red,
                  ),
                  CustomBody(
                    text: '٢٠ عرض',
                    color: Colors.blueAccent,
                  )
                ],
              ),
              const VirticalSpace(2),
              Padding(
                padding: EdgeInsets.only(right: SizeConfig.defaultSize! * 1.2),
                child: Row(
                  children: [
                    CircleAvatar(
                      maxRadius: SizeConfig.defaultSize! * 3,
                      backgroundImage: const AssetImage(
                        "assets/images/pro.jpg",
                      ),
                    ),
                    const HorizintalSpace(1),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CustomSubTitleMedium(text: ' ميليسا الدمشقية '),
                        const VirticalSpace(1),
                        Row(
                          children: [
                            const CustomLabel(
                              text: '٤.٦',
                              color: Colors.black,
                            ),
                            const HorizintalSpace(.8),
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                              size: SizeConfig.defaultSize! * 2,
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ]),
      )),
    );
  }
}
