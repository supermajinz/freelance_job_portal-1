import 'package:flutter/material.dart';
import 'package:freelance_job_portal/features/home/presentation/views/widget/custom_choice_chip.dart';

class ShowChip extends StatelessWidget {
  const ShowChip({super.key});
  @override
  Widget build(BuildContext context) {
    List<int> items = List.generate(10, (i) => i);

    return Wrap(
      direction: Axis.horizontal,
      children: items.map((i) => const CustomChoiceChip()).toList(),
    );
  }
}
