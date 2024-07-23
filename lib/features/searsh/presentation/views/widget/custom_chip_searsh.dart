import 'package:flutter/material.dart';
import 'package:freelance_job_portal/core/utils/size_config.dart';
import 'package:freelance_job_portal/core/widget/custom_label.dart';

class CustomChipSearsh extends StatelessWidget {
  const CustomChipSearsh({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      avatar: IconButton(onPressed: () {}, icon: const Icon(Icons.close)),
      selectedColor: const Color.fromARGB(255, 200, 225, 245),
      label: CustomLabel(
        text: text,
        color: Colors.black,
      ),
      selected: true,
      shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.all(Radius.circular(SizeConfig.defaultSize! * 1))),
      showCheckmark: false,
      labelPadding: EdgeInsets.all(SizeConfig.defaultSize! * .1),
      padding: EdgeInsets.symmetric(
          vertical: SizeConfig.defaultSize! * .1,
          horizontal: SizeConfig.defaultSize! * .5),
    );
  }
}
