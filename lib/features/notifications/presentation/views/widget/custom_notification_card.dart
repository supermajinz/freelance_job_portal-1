import 'package:flutter/material.dart';
import 'package:freelance_job_portal/core/constants/colors.dart';
import 'package:freelance_job_portal/core/widget/space.dart';

class CustomNotificationCard extends StatelessWidget {
  const CustomNotificationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
        color: const Color.fromARGB(255, 229, 232, 235),
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
        child: Container(
          padding: const EdgeInsets.all(15),
          height: 150,
          width: double.infinity,
          child: Column(children: [
            Row(
              children: [
                Container(
                  height: 13,
                  width: 13,
                  decoration: const BoxDecoration(
                      color: primaryColer,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
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
