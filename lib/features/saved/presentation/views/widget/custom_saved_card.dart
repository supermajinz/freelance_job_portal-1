import 'package:flutter/material.dart';
import 'package:freelance_job_portal/core/utils/size_config.dart';
import 'package:freelance_job_portal/core/widget/bookmark_button.dart';
import 'package:freelance_job_portal/core/widget/custom_subtitle_medium.dart';
import 'package:freelance_job_portal/core/widget/space.dart';
import 'package:freelance_job_portal/features/auth/data/models/user.dart';
import '../../../../../core/utils/functions/utils.dart';

class CustomSavedCard extends StatefulWidget {
  const CustomSavedCard({super.key, required this.user});

  final User user;

  @override
  State<CustomSavedCard> createState() => _CustomSavedCardState();
}

class _CustomSavedCardState extends State<CustomSavedCard> {
  @override
  Widget build(BuildContext context) {
    final userName =
        '${widget.user.firstname ?? ''} ${widget.user.lastname ?? ''}';

    final isClient = widget.user.role == "CLIENT";
    final isWorker = widget.user.role == "WORKER";

    final userPhotoUrl = isClient
        ? null
        : isWorker
            ? null
            : null;

    final backgroundColor =
        userPhotoUrl == null ? Utils.getBackgroundColor(userName) : null;
    return Container(
      padding: EdgeInsets.only(
          top: SizeConfig.defaultSize! * .8,
          bottom: SizeConfig.defaultSize! * .8),
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColorLight,
          borderRadius:
              BorderRadius.all(Radius.circular(SizeConfig.defaultSize! * 1.5))),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const HorizintalSpace(1),
          CircleAvatar(
            radius: SizeConfig.defaultSize! * 5,
            backgroundColor: backgroundColor,
            backgroundImage:
                userPhotoUrl != null ? NetworkImage(userPhotoUrl) : null,
            child: userPhotoUrl == null
                ? Center(
                    child: Text(
                      Utils.getInitials(userName),
                      style: const TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  )
                : null,
          ),
          const HorizintalSpace(1),
          CustomSubTitleMedium(
            text: '${widget.user.firstname} ${widget.user.lastname}',
          ),
          const Spacer(),
          BookmarkButton(isProject: false, id: widget.user.id!)
        ],
      ),
    );
  }
}
