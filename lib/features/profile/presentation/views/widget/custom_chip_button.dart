import 'package:flutter/material.dart';
import 'package:freelance_job_portal/core/utils/size_config.dart';
import 'package:freelance_job_portal/core/widget/custom_label.dart';

class CustomChipButton extends StatelessWidget {
  const CustomChipButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      avatar: IconButton(onPressed: () {}, icon: const Icon(Icons.close)),
      selectedColor: const Color.fromARGB(255, 200, 225, 245),
      label: const CustomLabel(text: "Fluter developer"),
      selected: true,
      shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.all(Radius.circular(SizeConfig.defaultSize! * 1))),
      showCheckmark: false,
      labelPadding: EdgeInsets.all(SizeConfig.defaultSize! * .5),
      padding: EdgeInsets.all(SizeConfig.defaultSize! * .5),
    );
  }
}
