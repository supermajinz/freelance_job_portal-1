import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelance_job_portal/core/utils/size_config.dart';
import 'package:freelance_job_portal/core/widget/bookmark_button.dart';
import 'package:freelance_job_portal/core/widget/custom_body_medium.dart';
import 'package:freelance_job_portal/core/widget/custom_subtitle_medium.dart';
import 'package:freelance_job_portal/core/widget/space.dart';
import 'package:freelance_job_portal/features/auth/data/models/user.dart';
import '../../../../auth/presentation/view_models/bloc/auth_bloc.dart';
import '../../view_models/favorites_bloc/favorites_bloc.dart';

class CustomSavedCard extends StatefulWidget {
  const CustomSavedCard({super.key, required this.user});

  final User user;

  @override
  State<CustomSavedCard> createState() => _CustomSavedCardState();
}

class _CustomSavedCardState extends State<CustomSavedCard> {
  bool isBookmarked = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          top: SizeConfig.defaultSize! * .8,
          bottom: SizeConfig.defaultSize! * .8),
      height: SizeConfig.defaultSize! * 12,
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColorLight,
          borderRadius: BorderRadius.all(
              Radius.circular(SizeConfig.defaultSize! * 1.5))),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: SizeConfig.defaultSize! * 6.5,
            backgroundImage: const AssetImage(
              "assets/images/pro.jpg",
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomSubTitleMedium(
                text: '${widget.user.firstname} ${widget.user.lastname}',
              ),
              const VirticalSpace(.5),
              CustomBody(
                text: widget.user.email!,
              ),
            ],
          ),
          const Spacer(),
          BookmarkButton(isProject: false, id: widget.user.id!)
        ],
      ),
    );
  }
}
