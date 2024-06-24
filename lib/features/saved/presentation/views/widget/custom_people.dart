import 'package:flutter/material.dart';

class CustomPeople extends StatelessWidget {
  const CustomPeople({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 85,
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 201, 224, 243),
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      margin: const EdgeInsets.symmetric(vertical: 2),
      child: const ListTile(
        trailing: Icon(Icons.bookmark),
        isThreeLine: true,
        leading: CircleAvatar(
          radius: 30,
          backgroundImage: AssetImage(
            "assets/images/pro.jpg",
          ),
        ),
        title: Text(
          "melisa",
          style: TextStyle(fontSize: 20),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Ui/Ux Designer",
              style: TextStyle(fontSize: 16),
            ),
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
      ),
    );
  }
}
