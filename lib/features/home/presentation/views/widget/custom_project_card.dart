import 'package:flutter/material.dart';
import 'package:freelance_job_portal/core/widget/space.dart';
import 'package:freelance_job_portal/features/home/presentation/views/widget/custom_choice_chip.dart';

class CustomProjectCard extends StatelessWidget {
  const CustomProjectCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: const EdgeInsets.all(7),
        child: Container(
          padding: const EdgeInsets.only(left: 12, top: 2),
          height: 245,
          width: 350,
          child: Column(children: [
            Row(
              children: [
                const Text("Order Management App",
                    style: TextStyle(fontSize: 18)),
                const Spacer(),
                const Text("1d", style: TextStyle(fontSize: 15)),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.bookmark_add_outlined))
              ],
            ),
            const Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod temp..",
                style: TextStyle(fontSize: 15, color: Colors.grey)),
            const VirticalSpace(0.5),
            SizedBox(
              height: 40,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                return const CustomChoiceChip();
              },),
            ),
            const VirticalSpace(0.5),
            Container(
              margin: const EdgeInsets.only(right: 12),
              child: const Row(
                children: [
                  Text("10M S.P",
                      style: TextStyle(fontSize: 15, color: Colors.green)),
                  Spacer(),
                  Text("3 Months",
                      style: TextStyle(fontSize: 15, color: Colors.blueAccent)),
                  Spacer(),
                  Text("20 Offers",
                      style: TextStyle(fontSize: 15, color: Colors.blueAccent)),
                ],
              ),
            ),
            const VirticalSpace(1),
            const Row(
              children: [
                CircleAvatar(
                  maxRadius: 30,
                  backgroundImage: AssetImage(
                    "assets/images/pro.jpg",
                  ),
                ),
                HorizintalSpace(1),
                Column(
                  children: [
                    Text(
                      "melisa",
                      style: TextStyle(fontSize: 20),
                    ),
                    VirticalSpace(1),
                    Row(
                      children: [
                        Text("4.6"),
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 20,
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
          ]),
        ));
  }
}
