import 'package:flutter/material.dart';
import 'package:freelance_job_portal/core/widget/space.dart';

class CustomPayment extends StatelessWidget {
  const CustomPayment({super.key, required this.url, required this.text});
  final String url;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(width: 1, color: Colors.grey),
              image: DecorationImage(image: AssetImage(url)),
            ),
            child: Image.asset(url, height: 50, width: 110, fit: BoxFit.fill)),
        const VirticalSpace(1),
        Text(text,
            maxLines: 2,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge),
      ],
    );
  }
}
