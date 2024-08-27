import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelance_job_portal/core/utils/size_config.dart';
import 'package:freelance_job_portal/core/widget/bookmark_button.dart';
import 'package:freelance_job_portal/core/widget/custom_body_medium.dart';
import 'package:freelance_job_portal/core/widget/custom_label.dart';
import 'package:freelance_job_portal/core/widget/custom_money_body.dart';
import 'package:freelance_job_portal/core/widget/custom_subtitle_medium.dart';
import 'package:freelance_job_portal/core/widget/space.dart';
import 'package:freelance_job_portal/features/home/presentation/views/widget/custom_choice_chip.dart';
import 'package:freelance_job_portal/features/projects/data/model/project_model/project_model.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../../../../core/utils/dependency_injection.dart';
import '../../../../../core/utils/functions/utils.dart';
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
      child: SizedBox(
        width: MediaQuery.of(context).size.width * .85,
        height: SizeConfig.defaultSize! * 35,
        child: Card(
          child: Container(
            padding: EdgeInsets.only(
              top: SizeConfig.defaultSize! * 0.2,
              // bottom: SizeConfig.defaultSize! * .3,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      EdgeInsets.only(right: SizeConfig.defaultSize! * 1.2),
                  child: Row(
                    children: [
                      Container(
                        // width: SizeConfig.defaultSize! * 20,
                        padding:
                            EdgeInsets.only(top: SizeConfig.defaultSize! * 1),
                        child: Text(
                          widget.project.name,
                          textAlign: TextAlign.start,
                          style: Theme.of(context).textTheme.titleMedium!,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const Spacer(),
                      BookmarkButton(isProject: true, id: widget.project.id)
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                    top: SizeConfig.defaultSize! * .0,
                    right: SizeConfig.defaultSize! * 1.7,
                    left: SizeConfig.defaultSize! * 1.7,
                  ),
                  // width: SizeConfig.defaultSize! * 5,
                  child: Text(
                    formattedCreateDate,
                    style: const TextStyle(color: Colors.grey),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    right: SizeConfig.defaultSize! * 1.2,
                    left: SizeConfig.defaultSize! * 1.2,
                    top: SizeConfig.defaultSize! * .5,
                  ),
                  child: CustomBody(text: widget.project.description),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      right: SizeConfig.defaultSize! * 1.2,
                      top: SizeConfig.defaultSize! * 2),
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
                          color: Theme.of(context).colorScheme.secondary,
                        );
                      },
                    ),
                  ),
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Flexible(
                      flex: 2,
                      child: CustomMoneyBody(
                        isCurrency: true,
                        maxLines: 1,
                        text:
                            '${widget.project.minBudget} - ${widget.project.maxBudget}',
                        color: Colors.green,
                      ),
                    ),
                    Flexible(
                      child: CustomMoneyBody(
                        isday: true,
                        text: '${widget.project.expectedDuration}',
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Padding(
                  padding: EdgeInsets.only(
                    right: SizeConfig.defaultSize! * 1.2,
                    top: SizeConfig.defaultSize! * 1,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Center(
                        child: Builder(builder: (context) {
                          final userId = context.read<AuthBloc>().state
                                  is AuthAuthenticated
                              ? (context.read<AuthBloc>().state
                                      as AuthAuthenticated)
                                  .id
                              : null;
                          final client = widget.project.client;
                          final clientName =
                              '${client?.userDto?.firstname ?? 'Unknown'} ${client?.userDto?.lastname ?? ''}';
                          final clientPhotoUrl = client
                                      ?.photoDtOs?.isNotEmpty ==
                                  true
                              ? "${DependencyInjection.baseUrl}file/photo/${client!.photoDtOs![0].photo}"
                              : null;
                          final backgroundColor = clientPhotoUrl == null
                              ? Utils.getBackgroundColor(clientName)
                              : null;
                          return CircleAvatar(
                              radius: SizeConfig.defaultSize! * 3,
                              backgroundColor: backgroundColor,
                              backgroundImage: clientPhotoUrl != null
                                  ? NetworkImage(clientPhotoUrl)
                                  : null,
                              child: clientPhotoUrl == null
                                  ? Center(
                                      child: Text(
                                        Utils.getInitials(clientName),
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 24),
                                      ),
                                    )
                                  : null);
                        }),
                      ),
                      const HorizintalSpace(1),
                      Column(
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
                      const Spacer(),
                      CustomBody(
                        text: '${widget.project.offerCount} عرض',
                        color: Colors.blueAccent,
                        textStyle: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const HorizintalSpace(1),
                    ],
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
