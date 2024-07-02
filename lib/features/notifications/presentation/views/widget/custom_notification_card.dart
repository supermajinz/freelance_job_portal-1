import 'package:flutter/material.dart';
import 'package:freelance_job_portal/core/constants/colors.dart';
import 'package:freelance_job_portal/core/utils/size_config.dart';
import 'package:freelance_job_portal/core/widget/space.dart';

class CustomNotificationCard extends StatelessWidget {
  const CustomNotificationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
        color: const Color.fromARGB(255, 246, 248, 250),
        margin:  EdgeInsets.symmetric(horizontal: SizeConfig.defaultSize!*1.5, vertical: SizeConfig.defaultSize!*.5),
        child: Container(
          padding: EdgeInsets.all(SizeConfig.defaultSize!*1.5),
          height: SizeConfig.defaultSize!*15.5,
          width: double.infinity,
          child: Column(children: [
            Row(
              children: [
                Container(
                  height: SizeConfig.defaultSize!*1.3,
                  width:SizeConfig.defaultSize!*1.3,
                  decoration:  BoxDecoration(
                      color: primaryColer,
                      borderRadius: BorderRadius.all(Radius.circular(SizeConfig.defaultSize!*2))),
                ),
                const HorizintalSpace(1),
                const Text("Apply Success",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ],
            ),
            const VirticalSpace(1),
            const Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod temp..",
                style: TextStyle(fontSize: 15, color: Colors.grey)),
            const VirticalSpace(1.5),
            const Row(
              children: [
                Icon(
                  Icons.access_time_filled_outlined,
                  color: Colors.green,
                ),
                HorizintalSpace(1),
                Text(
                  "4 m ago",
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            )
          ]),
        ));
  }
}
