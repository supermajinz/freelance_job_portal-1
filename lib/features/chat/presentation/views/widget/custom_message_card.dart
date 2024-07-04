import 'package:flutter/material.dart';
import 'package:freelance_job_portal/core/utils/size_config.dart';
import 'package:freelance_job_portal/core/widget/space.dart';

class CustomMessageCard extends StatelessWidget {
  const CustomMessageCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: SizeConfig.defaultSize!*6.7,
        margin:  EdgeInsets.only(right: SizeConfig.defaultSize!*1),
        child:  Row(
          children: [
            CircleAvatar(
              radius:SizeConfig.defaultSize!*3,
              backgroundImage: const AssetImage(
                "assets/images/pro.jpg",
              ),
            ),
            const HorizintalSpace(1),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "Xabi Alonso",
                      style: TextStyle(fontSize: 18),
                    ),
                    HorizintalSpace(12),
                    Text("Project Name",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold))
                  ],
                ),
                VirticalSpace(1),
                Text(
                  "Lorem ipsum dolor sit amet, consectetur .........",
                  style: TextStyle(
                      fontSize: 14, color: Color.fromARGB(255, 73, 73, 73)),
                ),
              ],
            ),
          ],
        ));
  }
}
