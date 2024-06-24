import 'package:flutter/material.dart';

class CustomProtofolioCard extends StatelessWidget {
  const CustomProtofolioCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: 180,
          height: 180,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: const DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage("assets/images/proto1.jpg"))),
        ),
        Positioned(
          bottom: 5,
          child: Container(
            alignment: Alignment.center,
            width: 180,
            height: 30,
            child: const Text(
              "Black Hold design",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
            ),
          ),
        ),
      ],
    );
  }
}
