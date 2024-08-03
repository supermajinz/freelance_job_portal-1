import 'package:flutter/material.dart';
import 'package:freelance_job_portal/features/home/presentation/views/widget/custom_choice_chip.dart';
import '../../../../../core/utils/size_config.dart';

class ShowChip extends StatelessWidget {
  const ShowChip({super.key});
  @override
  Widget build(BuildContext context) {
    List<int> items = List.generate(4, (i) => i);

    return Wrap(
      spacing: SizeConfig.defaultSize! * 1,
      direction: Axis.horizontal,
      runSpacing: SizeConfig.defaultSize! * .5,
      children: items
          .map((i) => CustomChoiceChip(
                text: "Laravel",
                color: Theme.of(context).focusColor,
              ))
          .toList(),
    );
  }
}
