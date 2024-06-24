import 'package:flutter/material.dart';

class CustomCartegoryCard extends StatelessWidget {
  const CustomCartegoryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 15),
      height: 140,
      width: 150,
      decoration: const BoxDecoration(
          color: Colors.cyanAccent,
          borderRadius: BorderRadius.all(Radius.circular(15))),
      child: Column(
        children: [
          Image.asset("assets/images/cat.png",
              height: 80, width: 100, fit: BoxFit.fill),
          const Spacer(),
          Container(
            alignment: Alignment.center,
            width: 150,
            height: 30,
            decoration: const BoxDecoration(
                color: Color.fromARGB(255, 123, 174, 180),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15))),
                    child: const Text("Programming",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 15),),
          ),
        ],
      ),
    );
  }
}
