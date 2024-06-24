import 'package:flutter/material.dart';
import 'package:freelance_job_portal/core/widget/space.dart';

class CustomMessageCard extends StatelessWidget {
  const CustomMessageCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 66,
        margin: const EdgeInsets.only(top: 15, left: 10, right: 10),
        padding: const EdgeInsets.only(bottom: 12),
        decoration: const BoxDecoration(
            border: Border(bottom: BorderSide(width: 1, color: Colors.grey))),
        child: const Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(
                "assets/images/pro.jpg",
              ),
            ),
            HorizintalSpace(1),
            Column(
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
                Spacer(),
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
