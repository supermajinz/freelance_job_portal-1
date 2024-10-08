import 'package:flutter/material.dart';
import 'package:freelance_job_portal/core/utils/dependency_injection.dart';
import 'package:freelance_job_portal/core/utils/size_config.dart';
import 'package:freelance_job_portal/core/widget/custom_body_medium.dart';
import 'package:freelance_job_portal/core/widget/custom_label.dart';
import 'package:freelance_job_portal/core/widget/custom_money_body.dart';
import 'package:freelance_job_portal/core/widget/custom_subtitle_medium.dart';
import 'package:freelance_job_portal/core/widget/space.dart';
import 'package:freelance_job_portal/features/home/presentation/views/widget/custom_choice_chip.dart';
import 'package:freelance_job_portal/features/my_project/presentation/views/widget/custom_timeline.dart';
import 'package:freelance_job_portal/features/projects/data/model/project_model/project_model.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../../../../core/utils/functions/utils.dart';
import '../../../../../core/widget/bookmark_button.dart';

class CustomProjectStatus extends StatelessWidget {
  const CustomProjectStatus({super.key, required this.projectModel});
  final ProjectModel projectModel;

  @override
  Widget build(BuildContext context) {
    final createDate = projectModel.createDate?.toLocal() ?? DateTime.now();
    final formattedCreateDate = timeago.format(createDate, locale: 'ar');
    final client = projectModel.client;
    final clientName =
        '${client?.userDto?.firstname ?? 'Unknown'} ${client?.userDto?.lastname ?? ''}';
    final clientPhotoUrl = client?.photoDtOs?.isNotEmpty == true
        ? "${DependencyInjection.baseUrl}file/photo/${client!.photoDtOs![0].photo}"
        : null;
    final backgroundColor =
        clientPhotoUrl == null ? Utils.getBackgroundColor(clientName) : null;
    return Card(
        color: Colors.white,
        margin: EdgeInsets.all(SizeConfig.defaultSize! * 0.7),
        child: Container(
          padding: EdgeInsets.only(
              top: SizeConfig.defaultSize! * 0.2,
              bottom: SizeConfig.defaultSize! * 1),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(top: SizeConfig.defaultSize! * 1),
                  width: SizeConfig.defaultSize! * 20,
                  margin: EdgeInsets.only(right: SizeConfig.defaultSize! * 1.2),
                  child: Text(
                    projectModel.name,
                    style: Theme.of(context).textTheme.titleMedium!,
                    maxLines: 2,
                  ),
                ),
                const Spacer(),
                Container(
                  padding: EdgeInsets.only(top: SizeConfig.defaultSize! * 1),
                  width: SizeConfig.defaultSize! * 5,
                  child: Text(
                    textAlign: TextAlign.center,
                    formattedCreateDate,
                    style: Theme.of(context).textTheme.labelLarge!,
                  ),
                ),
                BookmarkButton(isProject: true, id: projectModel.id)
              ],
            ),
            const VirticalSpace(2),
            Container(
              margin: EdgeInsets.only(right: SizeConfig.defaultSize! * 1.2),
              child: CustomBody(text: projectModel.description),
            ),
            CustomTimeline(
                currentStatus:
                    ProjectModel.projectStatuses.indexOf(projectModel.status)),
            const VirticalSpace(1),
            Container(
              margin: EdgeInsets.only(right: SizeConfig.defaultSize! * 1.2),
              child: SizedBox(
                height: SizeConfig.defaultSize! * 4,
                child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return const HorizintalSpace(.5);
                  },
                  scrollDirection: Axis.horizontal,
                  itemCount: projectModel.projectSkill.length,
                  itemBuilder: (context, index) {
                    return CustomChoiceChip(
                      text: projectModel.projectSkill[index].name,
                      color: Theme.of(context).colorScheme.secondary,
                    );
                  },
                ),
              ),
            ),
            const VirticalSpace(1.5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Flexible(
                  child: CustomMoneyBody(
                    isCurrency: true,
                    text: '${projectModel.minBudget} - ${projectModel.maxBudget}',
                    color: Colors.green,
                  ),
                ),
                Flexible(
                  child: CustomMoneyBody(
                    isday: true,
                    text: projectModel.expectedDuration.toString(),
                    color: Colors.red,
                  ),
                ),
                Flexible(
                  child: CustomBody(
                    text: "${projectModel.offerCount.toString()} عرض",
                    color: Colors.blueAccent,
                  ),
                )
              ],
            ),
            const VirticalSpace(2),
            Container(
              margin: EdgeInsets.only(right: SizeConfig.defaultSize! * 1.2),
              child: Row(
                children: [
                  CircleAvatar(
                      radius: SizeConfig.defaultSize! * 3.5,
                      backgroundColor: backgroundColor,
                      backgroundImage: clientPhotoUrl != null
                          ? NetworkImage(clientPhotoUrl)
                          : null,
                      child: clientPhotoUrl == null
                          ? Center(
                              child: Text(
                                Utils.getInitials(clientName),
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            )
                          : null),
                  const HorizintalSpace(1),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomSubTitleMedium(
                          text:
                              "${projectModel.client!.userDto!.firstname!} ${projectModel.client!.userDto!.lastname!}"),
                      const VirticalSpace(1),
                      Row(
                        children: [
                          CustomLabel(
                            text: projectModel.client!.rate.toString(),
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
        ));
  }
}
