import 'package:flutter/material.dart';
import 'package:freelance_job_portal/core/utils/size_config.dart';

class CustomChipButton extends StatelessWidget {
  const CustomChipButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      avatar: IconButton(onPressed: () {}, icon: const Icon(Icons.close)),
      selectedColor: const Color.fromARGB(255, 200, 225, 245),
      label: const Text("Fluter developer"),
      selected: true,
      shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.all(Radius.circular(SizeConfig.defaultSize! * 3))),
      showCheckmark: false,
      labelPadding: const EdgeInsets.all(5),
      padding: const EdgeInsets.all(5),
    );
  }
}
