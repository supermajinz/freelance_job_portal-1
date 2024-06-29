import 'package:flutter/material.dart';
import 'package:freelance_job_portal/core/utils/size_config.dart';

class CustomChoiceChip extends StatelessWidget {
  const CustomChoiceChip({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:  EdgeInsets.only(right:SizeConfig.defaultSize!*0.7),
      child:  ChoiceChip(
        selectedColor: const Color.fromARGB(255, 237, 232, 238),
        label: const Text("laravel"),
        selected: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(SizeConfig.defaultSize!*3))),
        showCheckmark: false,
        visualDensity: VisualDensity.compact,
      ),
    );
  }
}
