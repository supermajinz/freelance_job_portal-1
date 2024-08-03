import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelance_job_portal/core/utils/size_config.dart';
import 'package:freelance_job_portal/features/home/presentation/views/widget/chip.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/widget/custom_icon_back.dart';
import '../../../../../core/widget/custom_title.dart';
import '../../../../home/presentation/view_models/home_bloc/home_bloc.dart';

class Skill extends StatelessWidget {
  final int categoryId;

  const Skill({super.key, required this.categoryId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomTitle(
          text: 'المهارات',
          white: true,
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
        leading: CustomIconBack(
          onPressed: () {
            GoRouter.of(context).pop();
          },
        ),
      ),
      body: Container(
        alignment: Alignment.topCenter,
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.defaultSize! * 1,
          vertical: SizeConfig.defaultSize! * 2,
        ),
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeLoaded) {
              final skills = state.skillsByCategory[categoryId];
              if (skills != null) {
                return ShowChipHome(skills: skills);
              } else {
                return const Text('No skills found for this category.');
              }
            } else if (state is HomeFailure) {
              return Text(state.errMessage);
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
