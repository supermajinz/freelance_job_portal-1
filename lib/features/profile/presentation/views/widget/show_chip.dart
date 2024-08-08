import 'package:flutter/material.dart';
import 'package:freelance_job_portal/features/home/presentation/views/widget/custom_choice_chip.dart';
import 'package:freelance_job_portal/features/profile/data/models/profile/skill_dt_o.dart';
import '../../../../../core/utils/size_config.dart';

class ShowChip extends StatelessWidget {
  final List<SkillDtO> skills;
  const ShowChip({super.key, required this.skills});
  @override
  Widget build(BuildContext context) {
    //List<int> items = List.generate(4, (i) => i);

    return Wrap(
      spacing: SizeConfig.defaultSize! * 1,
      direction: Axis.horizontal,
      runSpacing: SizeConfig.defaultSize! * .5,
      children: skills
          .map((i) => CustomChoiceChip(
                text: i.name!,
                color: Theme.of(context).primaryColorDark,
              ))
          .toList(),
    );
  }
}
