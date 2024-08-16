import 'package:flutter/material.dart';
import '../../../../home/presentation/views/widget/custom_choice_chip.dart';

class CustomChipProject extends StatelessWidget {
  final String text;
  const CustomChipProject({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return CustomChoiceChip(
      text: text,
      color: Colors.black,
    );
  }
}
