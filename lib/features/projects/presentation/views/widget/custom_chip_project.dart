import 'package:flutter/material.dart';
import 'package:freelance_job_portal/core/utils/size_config.dart';
import 'package:freelance_job_portal/features/home/presentation/views/widget/custom_choice_chip.dart';

class CustomChipProject extends StatelessWidget {
  const CustomChipProject({super.key});
  @override
  Widget build(BuildContext context) {
    List<int> items = List.generate(4, (i) => i);

    return Wrap(
      runSpacing: SizeConfig.defaultSize! * .5,
      direction: Axis.horizontal,
      children: items
          .map((i) => const CustomChoiceChip(
                color: Colors.transparent,
              ))
          .toList(),
    );
  }
}
