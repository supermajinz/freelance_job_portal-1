import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelance_job_portal/core/utils/size_config.dart';
import 'package:freelance_job_portal/core/widget/bookmark_button.dart';
import 'package:freelance_job_portal/core/widget/custom_body_medium.dart';
import 'package:freelance_job_portal/core/widget/custom_label.dart';
import 'package:freelance_job_portal/core/widget/custom_subtitle_medium.dart';
import 'package:freelance_job_portal/core/widget/space.dart';
import 'package:freelance_job_portal/features/home/presentation/views/widget/custom_choice_chip.dart';
import 'package:freelance_job_portal/features/projects/data/model/project_model/project_model.dart';
import 'package:freelance_job_portal/features/saved/presentation/view_models/favorites_bloc/favorites_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:timeago/timeago.dart' as timeago;
import '../../../../auth/presentation/view_models/bloc/auth_bloc.dart';

class CustomProjectCard extends StatefulWidget {
  const CustomProjectCard({super.key, required this.project});
  final ProjectModel project;

  @override
  State<CustomProjectCard> createState() => _CustomProjectCardState();
}

class _CustomProjectCardState extends State<CustomProjectCard> {
  @override
  Widget build(BuildContext context) {
    final createDate = widget.project.createDate?.toLocal() ?? DateTime.now();
    final formattedCreateDate = timeago.format(createDate, locale: 'ar');
    return InkWell(
      onTap: () => GoRouter.of(context)
          .push('/showprojectdetails', extra: widget.project),
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
                      CustomSubTitleMedium(text: widget.project.name),
                      const Spacer(),
                      CustomLabel(
                        text: formattedCreateDate,
                      ),
                      BookmarkButton(isProject: true, id: widget.project.id)
                    ],
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(right: SizeConfig.defaultSize! * 1.2),
                  child: CustomBody(text: widget.project.description),
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
                      itemCount: widget.project.projectSkill.length,
                      itemBuilder: (context, index) {
                        return CustomChoiceChip(
                          text: widget.project.projectSkill[index].name,
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
                      isCurrency: true,
                      text:
                          '${widget.project.minBudget} - ${widget.project.maxBudget}',
                      color: Colors.green,
                    ),
                    CustomBody(
                      isday: true,
                      text: '${widget.project.expectedDuration}',
                      color: Colors.red,
                    ),
                    CustomBody(
                      text: '${widget.project.offerCount} عرض',
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
                              text:
                                  widget.project.client?.userDto!.firstname! ??
                                      ''),
                          const VirticalSpace(1),
                          Row(
                            children: [
                              CustomLabel(
                                text: "${widget.project.client?.rate ?? ''}",
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
