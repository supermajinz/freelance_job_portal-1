import 'package:flutter/material.dart';
import 'package:freelance_job_portal/core/utils/size_config.dart';
import 'package:freelance_job_portal/core/widget/space.dart';

class CustomZzz extends StatelessWidget {
  const CustomZzz({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:  EdgeInsets.symmetric(horizontal: SizeConfig.defaultSize!*3, vertical: SizeConfig.defaultSize!*1.5),
      margin: EdgeInsets.only(left: SizeConfig.defaultSize!*1.5, right:SizeConfig.defaultSize!*.5),
      height: 180,
      decoration: BoxDecoration(
          color: Colors.deepPurple, borderRadius: BorderRadius.circular(SizeConfig.defaultSize!*1)),
      child:  Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              SizedBox(
                width: SizeConfig.defaultSize!*10,
                child: const Text(
                  "Number of projects completed",
                  textAlign: TextAlign.center,
                  maxLines: 3,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const VirticalSpace(1),
              CircleAvatar(
                maxRadius: SizeConfig.defaultSize!*3,
                backgroundColor: const Color.fromARGB(255, 69, 49, 100),
                child: const Text(
                  "17",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          Column(
            children: [
              SizedBox(
                width: 100,
                child: Text(
                  "Percentage of projects delivered on deadline:",
                  textAlign: TextAlign.center,
                  maxLines: 3,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
              VirticalSpace(1),
              CircleAvatar(
                maxRadius: 30,
                backgroundColor: Color.fromARGB(255, 69, 49, 100),
                child: Text(
                  "86%",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
