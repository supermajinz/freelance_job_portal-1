import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelance_job_portal/core/widget/custom_empty.dart';
import 'package:freelance_job_portal/core/widget/custom_loading.dart';
import 'package:freelance_job_portal/core/widget/space.dart';
import 'package:freelance_job_portal/features/projects/presentation/views/widget/custom_project_card.dart';
import 'package:freelance_job_portal/features/saved/presentation/view_models/favorites_bloc/favorites_bloc.dart';

class FavoriteProjects extends StatelessWidget {
  const FavoriteProjects({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const VirticalSpace(.5),
        Expanded(
          child: BlocBuilder<FavoritesBloc, FavoritesState>(
            builder: (context, state) {
              if (state is GetFavoriteSuccess) {
                if (state.projects.isEmpty) {
                  return const CustomEmpty();
                } else {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.projects.length,
                    itemBuilder: (context, index) {
                      return CustomProjectCard(project: state.projects[index]);
                    },
                  );
                }
              } else if (state is FavoritesFailure) {
                return Center(child: Text(state.errMessage));
              } else {
                return const CustomLoading();
              }
            },
          ),
        ),
      ],
    );
  }
}
