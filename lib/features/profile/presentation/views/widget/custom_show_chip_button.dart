import 'package:flutter/material.dart';
import 'package:freelance_job_portal/features/profile/presentation/views/widget/custom_chip_button.dart';
import '../../../../../core/utils/size_config.dart';

class CustomShowChipButton extends StatelessWidget {
  const CustomShowChipButton({super.key});
  @override
  Widget build(BuildContext context) {
    List<int> items = List.generate(5, (i) => i);

    return Wrap(
      spacing: SizeConfig.defaultSize! * 1,
      direction: Axis.horizontal,
      runSpacing: SizeConfig.defaultSize! * .5,
      children: items
          .map((i) => const CustomChipButton(
                text: "Fluter developer",
              ))
          .toList(),
    );
  }
}
