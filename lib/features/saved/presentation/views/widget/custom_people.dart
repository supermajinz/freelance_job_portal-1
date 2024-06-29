import 'package:flutter/material.dart';
import 'package:freelance_job_portal/core/utils/size_config.dart';

class CustomPeople extends StatelessWidget {
  const CustomPeople({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.defaultSize! * 8.5,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 201, 224, 243),
        borderRadius:
            BorderRadius.all(Radius.circular(SizeConfig.defaultSize! * 1.5)),
      ),
      margin: EdgeInsets.symmetric(vertical: SizeConfig.defaultSize! * .2),
      child: ListTile(
        trailing: const Icon(Icons.bookmark),
        isThreeLine: true,
        leading: CircleAvatar(
          radius: SizeConfig.defaultSize! * 3,
          backgroundImage: const AssetImage(
            "assets/images/pro.jpg",
          ),
        ),
        title: const Text(
          "melisa",
          style: TextStyle(fontSize: 20),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Ui/Ux Designer",
              style: TextStyle(fontSize: 16),
            ),
            Row(
              children: [
                const Text("4.6"),
                Icon(
                  Icons.star,
                  color: Colors.yellow,
                  size: SizeConfig.defaultSize! * 2,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
