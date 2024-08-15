import 'package:flutter/material.dart';
import 'package:freelance_job_portal/features/projects/data/model/project_model/project_model.dart';
import '../../../../../core/utils/size_config.dart';
import '../../../../../core/widget/custom_container.dart';
import '../../../../../core/widget/custom_label.dart';
import '../../../../../core/widget/custom_meony.dart';
import '../../../../../core/widget/custom_subtitle_medium.dart';
import '../../../../../core/widget/space.dart';
import '../../../../projects/presentation/views/widget/custom_chip_project.dart';
import 'package:timeago/timeago.dart' as timeago;

class CustomBodyStatusDetails extends StatelessWidget {
  const CustomBodyStatusDetails({super.key, required this.projectModel});
  final ProjectModel projectModel;

  @override
  Widget build(BuildContext context) {
    final createDate = projectModel.createDate?.toLocal() ?? DateTime.now();
    final formattedCreateDate = timeago.format(createDate, locale: 'ar');
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: SizeConfig.defaultSize! * 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(Icons.laptop),
              Container(
                padding: EdgeInsets.only(right: SizeConfig.defaultSize! * 1.5),
                width: SizeConfig.defaultSize! * 20,
                child: Text(
                  projectModel.name,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge,
                  maxLines: 2,
                ),
              ),
              Column(
                children: [
                  CustomLabel(
                    text: formattedCreateDate,
                    color: Colors.black,
                  ),
                  CustomLabel(
                      text: projectModel.status,
                      color: projectModel.status == "open"
                          ? Colors.blue
                          : projectModel.status == "inProgress"
                              ? Theme.of(context).colorScheme.secondary
                              : projectModel.status == "submitted"
                                  ? Theme.of(context).colorScheme.secondary
                                  : projectModel.status == "completed"
                                      ? Theme.of(context).colorScheme.secondary
                                      : Theme.of(context).colorScheme.error)
                ],
              )
            ],
          ),
          const VirticalSpace(2),
          const CustomSubTitleMedium(text: "وصف المشروع:"),
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
          const VirticalSpace(4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const CustomSubTitleMedium(text: "الميزانية:"),
              CustomMeony(
                text: '${projectModel.minBudget} _ ${projectModel.maxBudget}',
              ),
            ],
          ),
          const VirticalSpace(3),
          Row(
            children: [
              const Expanded(
                  child: CustomSubTitleMedium(text: "المدة المتوقعة:")),
              Expanded(
                child: CustomContainer(
                  text: projectModel.expectedDuration.toString(),
                ),
              ),
            ],
          ),
          const VirticalSpace(3),
          const CustomSubTitleMedium(text: "المهارات المطلوبة:"),
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
