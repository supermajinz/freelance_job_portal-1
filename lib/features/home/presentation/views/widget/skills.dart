import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelance_job_portal/core/utils/dependency_injection.dart';
import 'package:freelance_job_portal/core/utils/size_config.dart';
import 'package:freelance_job_portal/features/home/presentation/views/widget/chip.dart';
import 'package:freelance_job_portal/features/projects/presentation/views/widget/custom_project_card.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/widget/custom_icon_back.dart';
import '../../../../../core/widget/custom_title.dart';
import '../../../../home/presentation/view_models/home_bloc/home_bloc.dart';
import '../../../../projects/data/model/project_model/project_model.dart';

class Skill extends StatefulWidget {
  final int categoryId;

  const Skill({super.key, required this.categoryId});

  @override
  State<Skill> createState() => _SkillState();
}

class _SkillState extends State<Skill> {
  List<ProjectModel> projects = [];

  @override
  void initState() {
    fetch();
    super.initState();
  }

  void fetch() {
    final res = DependencyInjection.provideSearchRepo().searchProjects(params: {
      "categories": [widget.categoryId]
    });
  }

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
      body: Column(
        children: [
          Container(
            alignment: Alignment.topCenter,
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.defaultSize! * 1,
              vertical: SizeConfig.defaultSize! * 2,
            ),
            child: BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                if (state is HomeLoaded) {
                  final skills = state.skillsByCategory[widget.categoryId];
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
          Expanded(
              child: ListView.builder(
                itemCount: projects.length,
                  itemBuilder: (context, index) =>
                      CustomProjectCard(project: projects[index]))),
        ],
      ),
    );
  }
}
