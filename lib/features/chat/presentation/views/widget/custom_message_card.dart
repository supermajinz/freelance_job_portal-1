import 'package:flutter/material.dart';
import 'package:freelance_job_portal/core/utils/size_config.dart';
import 'package:freelance_job_portal/core/widget/custom_label.dart';
import 'package:freelance_job_portal/features/chat/data/models/chat_model.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/functions/utils.dart';

class CustomMessageCard extends StatelessWidget {
  const CustomMessageCard({super.key, required this.room});

  final ChatRoomModel room;

  @override
  Widget build(BuildContext context) {
    final userName =
        '${room.recipient.firstname ?? ''} ${room.recipient.lastname ?? ''}';

    final isClient = room.recipient.role == "CLIENT";
    final isWorker = room.recipient.role == "WORKER";

    final userPhotoUrl = isClient
        ? null
        : isWorker
        ? null
        : null;

    final backgroundColor =
    userPhotoUrl == null ? Utils.getBackgroundColor(userName) : null;
    return ListTile(
      // isThreeLine: true,
      title: Text("${room.recipient.firstname} ${room.recipient.lastname}",
          style: Theme
              .of(context)
              .textTheme
              .titleLarge!.copyWith(fontWeight: FontWeight.normal)),
      leading: CircleAvatar(
        radius: SizeConfig.defaultSize! * 5,
        backgroundColor: backgroundColor?.withOpacity(.7),
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
      contentPadding: EdgeInsets.zero,
      onTap: () => GoRouter.of(context).push("/dms", extra: room),
    );
  }
}
