import 'package:flutter/material.dart';
import 'package:freelance_job_portal/core/utils/size_config.dart';
import 'package:freelance_job_portal/core/widget/custom_label.dart';
import 'package:freelance_job_portal/features/chat/data/models/chat_model.dart';

class CustomMessageCard extends StatelessWidget {
  const CustomMessageCard({super.key, required this.room});
  final ChatRoomModel room;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      // isThreeLine: true,
      title:
          Text("${room.recipient.firstname} ${room.recipient.lastname}", style: Theme.of(context).textTheme.titleLarge!),
      // subtitle: Text("Lorem ipsum dolor sit amet, consectetur .........",
      //     maxLines: 1,
      //     style: Theme.of(context)
      //         .textTheme
      //         .bodyLarge!
      //         .copyWith(overflow: TextOverflow.ellipsis)),
      leading: CircleAvatar(
          radius: SizeConfig.defaultSize! * 3,
          // child: Text(),
          // backgroundImage: const AssetImage(
          //   "assets/images/pro.jpg",
          // ),
      ),
      // trailing: const CustomLabel(
      //     text: "Project Name", color: Color.fromARGB(255, 73, 73, 73)),
    );
  }
}
