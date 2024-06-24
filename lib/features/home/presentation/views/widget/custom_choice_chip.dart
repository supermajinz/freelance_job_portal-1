import 'package:flutter/material.dart';

class CustomChoiceChip extends StatelessWidget {
  const CustomChoiceChip({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 7),
      child: const ChoiceChip(
        selectedColor: Color.fromARGB(255, 200, 225, 245),
        label: Text("Fluter developer"),
        selected: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(30))),
        showCheckmark: false,
        visualDensity: VisualDensity.compact,
      ),
    );
  }
}
