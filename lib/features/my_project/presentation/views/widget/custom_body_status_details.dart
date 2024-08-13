import 'package:flutter/material.dart';
import 'package:freelance_job_portal/features/projects/data/model/project_model/project_model.dart';
import '../../../../../core/utils/size_config.dart';
import '../../../../../core/widget/custom_container.dart';
import '../../../../../core/widget/custom_label.dart';
import '../../../../../core/widget/custom_meony.dart';
import '../../../../../core/widget/custom_sub_title.dart';
import '../../../../../core/widget/custom_subtitle_medium.dart';
import '../../../../../core/widget/space.dart';
import '../../../../projects/presentation/views/widget/custom_chip_project.dart';

class CustomBodyStatusDetails extends StatelessWidget {
  const CustomBodyStatusDetails({super.key, required this.projectModel});
  final ProjectModel projectModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: SizeConfig.defaultSize! * 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(Icons.laptop),
              CustomSubTitle(text: projectModel.name),
              Column(
                children: [
                  const CustomLabel(
                    text: "1d",
                    color: Colors.black,
                  ),
                  CustomLabel(
                    text: projectModel.status,
                    color: Colors.black,
                  )
                ],
              )
            ],
          ),
          const VirticalSpace(2),
          const CustomSubTitleMedium(text: "Description:"),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: SizeConfig.defaultSize! * .5,
            ),
            child: Text(
              projectModel.description,
              textAlign: TextAlign.start,
              maxLines: 5,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          const VirticalSpace(.5),
          InkWell(
            onTap: () {},
            child: Text(
              "show more",
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    decorationThickness: 2,
                    decoration: TextDecoration.underline,
                  ),
            ),
          ),
          const VirticalSpace(4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const CustomSubTitleMedium(text: "Price:"),
              CustomMeony(
                text: '${projectModel.minBudget} _ ${projectModel.maxBudget}',
              ),
            ],
          ),
          const VirticalSpace(3),
          Row(
            children: [
              const Expanded(
                  child: CustomSubTitleMedium(text: "Delivery Time:")),
              Expanded(
                child: CustomContainer(
                  text: projectModel.expectedDuration.toString(),
                ),
              ),
            ],
          ),
          const VirticalSpace(3),
          const CustomSubTitleMedium(text: "Skills Required:"),
          const VirticalSpace(1),
          Wrap(
            spacing: SizeConfig.defaultSize! * 1,
            runSpacing: SizeConfig.defaultSize! * .5,
            children: [
              for (var skill in projectModel.projectSkill)
                CustomChipProject(text: skill.name),
            ],
          ),
          const VirticalSpace(3),
        ],
      ),
    );
  }
}
