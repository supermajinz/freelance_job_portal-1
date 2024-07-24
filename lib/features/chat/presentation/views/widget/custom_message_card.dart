import 'package:flutter/material.dart';
import 'package:freelance_job_portal/core/utils/size_config.dart';
import 'package:freelance_job_portal/core/widget/custom_label.dart';
import 'package:freelance_job_portal/core/widget/custom_subtitle_medium.dart';

class CustomMessageCard extends StatelessWidget {
  const CustomMessageCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: SizeConfig.defaultSize! * 1),
      child: ListTile(
        isThreeLine: true,
        title: const CustomSubTitleMedium(text: "Xabi Alonso"),
        subtitle: Text("Lorem ipsum dolor sit amet, consectetur .........",
            maxLines: 1,
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(overflow: TextOverflow.ellipsis)),
        leading: CircleAvatar(
            radius: SizeConfig.defaultSize! * 3,
            backgroundImage: const AssetImage(
              "assets/images/pro.jpg",
            )),
        trailing: const CustomLabel(
            text: "Project Name", color: Color.fromARGB(255, 73, 73, 73)),
      ),
      // child: Row(
      //   children: [
      //     CircleAvatar(
      //       radius: SizeConfig.defaultSize! * 3,
      //       backgroundImage: const AssetImage(
      //         "assets/images/pro.jpg",
      //       ),
      //     ),
      //     const HorizintalSpace(1),
      //     const Column(
      //       crossAxisAlignment: CrossAxisAlignment.start,
      //       children: [
      //         Row(
      //           children: [
      //             Text(
      //               "Xabi Alonso",
      //               style: TextStyle(fontSize: 18),
      //             ),
      //             HorizintalSpace(12),
      //             Text("Project Name",
      //                 style: TextStyle(
      //                     fontSize: 15, fontWeight: FontWeight.bold))
      //           ],
      //         ),
      //         VirticalSpace(1),
      //         Text(
      //           "Lorem ipsum dolor sit amet, consectetur .........",
      //           style: TextStyle(
      //               fontSize: 14, color: Color.fromARGB(255, 73, 73, 73)),
      //         ),
      //       ],
      //     ),
      //   ],
      // )
    );
  }
}
