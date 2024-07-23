import 'package:flutter/material.dart';
import 'package:freelance_job_portal/core/utils/size_config.dart';
import 'package:freelance_job_portal/features/searsh/presentation/views/widget/custom_chip_searsh.dart';

class CustomChip extends StatelessWidget {
  const CustomChip({super.key});
  @override
  Widget build(BuildContext context) {
    List<int> items = List.generate(3, (i) => i);

    return Wrap(
      spacing: SizeConfig.defaultSize! * .5,
      direction: Axis.horizontal,
      children: items
          .map((i) => const CustomChipSearsh(
                text: 'Flutter Developer',
              ))
          .toList(),
    );
  }
}
