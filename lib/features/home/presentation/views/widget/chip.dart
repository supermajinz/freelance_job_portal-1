import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelance_job_portal/features/home/presentation/views/widget/custom_choice_chip.dart';
import '../../../../../core/utils/size_config.dart';
import '../../../../home/data/model/skills/skills.dart';
import '../../../../home/presentation/view_models/home_bloc/home_bloc.dart';

class ShowChipHome extends StatelessWidget {
  const ShowChipHome({super.key, required this.skills});
  final List<Skills> skills;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state is HomeLoaded) {
          return Wrap(
            spacing: SizeConfig.defaultSize! * 1,
            direction: Axis.horizontal,
            runSpacing: SizeConfig.defaultSize! * .5,
            children: skills
                .map((skill) => CustomChoiceChip(
                      text: skill.name,
                      color: Theme.of(context).focusColor,
                    ))
                .toList(),
          );
        } else if (state is HomeFailure) {
          return Text(state.errMessage);
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
