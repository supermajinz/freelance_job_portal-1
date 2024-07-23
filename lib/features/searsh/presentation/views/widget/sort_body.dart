import 'package:flutter/material.dart';
import 'package:freelance_job_portal/core/utils/size_config.dart';
import 'package:freelance_job_portal/core/widget/custom_sub_title.dart';
import 'package:freelance_job_portal/core/widget/space.dart';
import 'package:freelance_job_portal/features/profile/presentation/views/widget/custom_dropdown_searsh.dart';
import 'package:freelance_job_portal/features/searsh/presentation/views/widget/custom_chip.dart';
import 'package:freelance_job_portal/features/searsh/presentation/views/widget/range_slider.dart';

import '../../../../../core/widget/custom_button_general.dart';

class SortBody extends StatelessWidget {
  const SortBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: SizeConfig.defaultSize!*1),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const VirticalSpace(2),
              const CustomSubTitle(
                text: "Category",
              ),
              const VirticalSpace(1.5),
              const CustomDropdownSearsh1(),
              const VirticalSpace(4),
              const CustomSubTitle(
                text: "Skills",
              ),
              const VirticalSpace(1.5),
              const CustomDropdownSearsh1(),
              const VirticalSpace(2),
              const CustomChip(),
              const VirticalSpace(3),
              const CustomSubTitle(
                text: "By Deadline",
              ),
              const VirticalSpace(2),
              const RangeSliderExample(),
              const VirticalSpace(3),
              const CustomSubTitle(
                text: "By budget",
              ),
              const VirticalSpace(2),
              const RangeSliderExample(),
              const VirticalSpace(4),
              Center(
                child: CustomButtonGeneral(
                    onPressed: () {},
                    color: Theme.of(context).primaryColor,
                    textcolor: Colors.white,
                    text: "filter",
                    borderSide: const BorderSide(width: 0),
                    width: SizeConfig.defaultSize! * 20),
              ),
              const VirticalSpace(2),
            ],
          ),
        )
      ],
    );
  }
}
