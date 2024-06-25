import 'package:flutter/material.dart';
import 'package:freelance_job_portal/core/widget/space.dart';

class CustomProfileCard extends StatelessWidget {
  const CustomProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      height: 120,
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.tertiary,
          borderRadius: BorderRadius.all(Radius.circular(15))),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CircleAvatar(
            radius: 65,
            backgroundImage: AssetImage(
              "assets/images/pro.jpg",
            ),
          ),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Nansy Ajram",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              VirticalSpace(1),
              Text("Flutter Developer", style: TextStyle(fontSize: 15)),
              VirticalSpace(0.5),
              Row(
                children: [
                  Text("4.6",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                  HorizintalSpace(0.5),
                  Icon(
                    Icons.star,
                    color: Colors.yellow,
                    size: 20,
                  )
                ],
              )
            ],
          ),
          const HorizintalSpace(8),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.chat_outlined,
                size: 30,
              ))
        ],
      ),
    );
  }
}
