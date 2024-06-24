import 'package:flutter/material.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({super.key, required this.disc, required this.image});
  final String disc;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [Image.asset(image,height: 450,width: 500,fit: BoxFit.fill ,), Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 40),
        child: Text(disc,textAlign: TextAlign.center,),
      )],
    );
  }
}
