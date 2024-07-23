import 'package:flutter/material.dart';
import 'package:freelance_job_portal/core/utils/size_config.dart';
import 'package:freelance_job_portal/core/widget/custom_label.dart';

class CustomChoiceChip extends StatelessWidget {
  const CustomChoiceChip({super.key, required this.color});
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: SizeConfig.defaultSize! * 1),
      child: ChoiceChip(
        selectedColor:color,
        label: const CustomLabel(text: "Laravel"),
        selected: true,
        shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.all(Radius.circular(SizeConfig.defaultSize! * 3))),
        showCheckmark: false,
        visualDensity: VisualDensity.compact,
      ),
    );
  }
}
