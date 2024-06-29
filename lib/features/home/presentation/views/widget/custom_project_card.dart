import 'package:flutter/material.dart';
import 'package:freelance_job_portal/core/utils/size_config.dart';
import 'package:freelance_job_portal/core/widget/space.dart';
import 'package:freelance_job_portal/features/home/presentation/views/widget/custom_choice_chip.dart';

class CustomProjectCard extends StatelessWidget {
  const CustomProjectCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
        margin:  EdgeInsets.all(SizeConfig.defaultSize!*0.7),
        child: Container(
          padding: EdgeInsets.only(left: SizeConfig.defaultSize!*1.2, top: SizeConfig.defaultSize!*0.2),
          height: SizeConfig.defaultSize!*25,
          width: SizeConfig.defaultSize!*35,
          child: Column(children: [
            Row(
              children: [
                const Text("Order Management App",
                    style: TextStyle(fontSize: 18,color: Colors.black)),
                const Spacer(),
                const Text("1d", style: TextStyle(fontSize: 15)),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.bookmark_add_outlined))
              ],
            ),
            const Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod temp..",
                overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                style: TextStyle(fontSize: 15, color: Colors.grey)),
            const VirticalSpace(1),
            SizedBox(
              height: SizeConfig.defaultSize!*4,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                return const CustomChoiceChip();
              },),
            ),
            const VirticalSpace(0.5),
            Container(
              margin:  EdgeInsets.only(right:SizeConfig.defaultSize!*1.2),
              child: const Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("10M S.P",
                      style: TextStyle(fontSize: 15, color: Colors.green)),
                
                  Text("3 Months",
                      style: TextStyle(fontSize: 15, color: Colors.blueAccent)),
                  
                  Text("20 Offers",
                      style: TextStyle(fontSize: 15, color: Colors.blueAccent)),
                ],
              ),
            ),
            const VirticalSpace(2),
             Row(
              children: [
                CircleAvatar(
                  maxRadius: SizeConfig.defaultSize!*3,
                  backgroundImage: const AssetImage(
                    "assets/images/pro.jpg",
                  ),
                ),
                const HorizintalSpace(1),
                Column(
                  children: [
                    const Text(
                      "melisa",
                      style: TextStyle(fontSize: 20),
                    ),
                    const VirticalSpace(1),
                    Row(
                      children: [
                        const Text("4.6"),
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: SizeConfig.defaultSize!*2,
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
