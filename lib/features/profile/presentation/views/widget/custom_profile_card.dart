import 'package:flutter/material.dart';
import 'package:freelance_job_portal/core/utils/size_config.dart';
import 'package:freelance_job_portal/core/widget/space.dart';
import 'package:go_router/go_router.dart';

class CustomProfileCard extends StatelessWidget {
  const CustomProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top:SizeConfig.defaultSize!*.8, bottom:SizeConfig.defaultSize!*.8),
      height: SizeConfig.defaultSize!*12,
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColorLight,
          borderRadius:  BorderRadius.all(Radius.circular(SizeConfig.defaultSize!*1.5))),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           CircleAvatar(
            radius: SizeConfig.defaultSize!*6.5,
            backgroundImage: const AssetImage(
              "assets/images/pro.jpg",
            ),
          ),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "أحمد مراد",
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              VirticalSpace(.5),
              Text("مطور تطبيقات موبايل",
                  style: TextStyle(fontSize: 18, color: Colors.black)),
              VirticalSpace(0.2),
              Row(
                children: [
                  Text("4.6",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
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
          const HorizintalSpace(5),
          IconButton(
              onPressed: () {
                GoRouter.of(context).push('/editprofile');
              },
              icon: const Icon(
                Icons.edit_calendar_outlined,
                size: 30,
              ))
        ],
      ),
    );
  }
}
