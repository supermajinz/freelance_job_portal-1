import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelance_job_portal/core/widget/custom_empty.dart';
import 'package:freelance_job_portal/core/widget/custom_loading.dart';
import 'package:freelance_job_portal/core/widget/space.dart';
import 'package:freelance_job_portal/features/saved/presentation/view_models/favorites_bloc/favorites_bloc.dart';
import 'package:freelance_job_portal/features/saved/presentation/views/widget/custom_saved_card.dart';

class FavoritePeople extends StatelessWidget {
  const FavoritePeople({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const VirticalSpace(1),
        Expanded(
          child: BlocBuilder<FavoritesBloc, FavoritesState>(
            builder: (context, state) {
              print("will favorite people $state");
              if (state is GetFavoriteSuccess) {
                if (state.users.isEmpty) {
                  return const CustomEmpty();
                } else {
                  return ListView.separated(
                    // physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    separatorBuilder: (context, index) {
                      return const VirticalSpace(.5);
                    },
                    itemCount: state.users.length,
                    itemBuilder: (context, index) {
                      return CustomSavedCard(
                        user: state.users[index],
                      );
                    },
                  );
                }
              }
              if (state is FavoritesFailure) {
                return Center(child: Text(state.errMessage));
              }
              return const CustomLoading();
            },
          ),
        ),
      ],
    );
  }
}
