import 'package:flutter/material.dart';
import 'package:freelance_job_portal/core/utils/size_config.dart';
import 'package:freelance_job_portal/core/widget/custom_body_medium.dart';
import 'package:freelance_job_portal/core/widget/custom_label.dart';
import 'package:freelance_job_portal/core/widget/custom_subtitle_medium.dart';
import 'package:freelance_job_portal/core/widget/space.dart';
import 'package:freelance_job_portal/features/home/presentation/views/widget/custom_choice_chip.dart';
import 'package:freelance_job_portal/features/projects/data/model/project_model/project_model.dart';
import 'package:go_router/go_router.dart';

class CustomProjectCard extends StatelessWidget {
  const CustomProjectCard({super.key, required this.project});
  final ProjectModel project;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>
          GoRouter.of(context).push('/showprojectdetails', extra: project),
      child: AspectRatio(
        aspectRatio:
            SizeConfig.defaultSize! * 1.2 / SizeConfig.defaultSize! * 1,
        child: Card(
            child: Container(
          padding: EdgeInsets.only(top: SizeConfig.defaultSize! * 0.2),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      EdgeInsets.only(right: SizeConfig.defaultSize! * 1.2),
                  child: Row(
                    children: [
                      CustomSubTitleMedium(text: project.name),
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
                  padding:
                      EdgeInsets.only(right: SizeConfig.defaultSize! * 1.2),
                  child: CustomBody(text: project.description),
                ),
                const VirticalSpace(1),
                Padding(
                  padding:
                      EdgeInsets.only(right: SizeConfig.defaultSize! * 1.2),
                  child: SizedBox(
                    height: SizeConfig.defaultSize! * 4,
                    child: ListView.separated(
                      separatorBuilder: (context, index) {
                        return const HorizintalSpace(.5);
                      },
                      scrollDirection: Axis.horizontal,
                      itemCount: project.projectSkill.length,
                      itemBuilder: (context, index) {
                        return CustomChoiceChip(
                          text: project.projectSkill[index].name,
                          color: Theme.of(context).focusColor,
                        );
                      },
                    ),
                  ),
                ),
                const VirticalSpace(1),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CustomBody(
                      text: '${project.minBudget}-${project.maxBudget}  ل.س',
                      color: Colors.green,
                    ),
                    CustomBody(
                      text: '${project.expectedDuration} شهور',
                      color: Colors.red,
                    ),
                    CustomBody(
                      text: '${project.offerCount} عرض',
                      color: Colors.blueAccent,
                    )
                  ],
                ),
                const VirticalSpace(2),
                Padding(
                  padding:
                      EdgeInsets.only(right: SizeConfig.defaultSize! * 1.2),
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
                          CustomSubTitleMedium(
                              text: project.client?.userDto!.firstname! ?? ''),
                          const VirticalSpace(1),
                          Row(
                            children: [
                              CustomLabel(
                                text: "${project.client?.rate ?? ''}",
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
      ),
    );
  }
}
