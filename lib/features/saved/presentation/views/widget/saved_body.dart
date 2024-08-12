import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelance_job_portal/core/utils/size_config.dart';
import 'package:freelance_job_portal/core/widget/custom_icon_back.dart';
import 'package:freelance_job_portal/core/widget/custom_loading.dart';
import 'package:freelance_job_portal/core/widget/custom_title.dart';
import 'package:freelance_job_portal/core/widget/space.dart';
import 'package:freelance_job_portal/features/projects/presentation/views/widget/custom_project_card.dart';
import 'package:freelance_job_portal/features/saved/presentation/view_models/favorites_bloc/favorites_bloc.dart';
import 'package:freelance_job_portal/features/saved/presentation/views/widget/custom_saved_card.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/widget/custom_empty.dart';
import '../../../../auth/presentation/view_models/bloc/auth_bloc.dart';

class SavedBody extends StatelessWidget {
  const SavedBody({super.key});

  @override
  Widget build(BuildContext context) {
    final userId = (context.read<AuthBloc>().state as AuthAuthenticated).id;
    context.read<FavoritesBloc>().add(GetFavoriteUser(userId));
    context.read<FavoritesBloc>().add(GetFavoriteProject(userId));
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const CustomTitle(text: "العناصر المحفوظة", white: true),
          centerTitle: true,
          backgroundColor: Theme.of(context).primaryColor,
          leading: CustomIconBack(
            onPressed: () {
              GoRouter.of(context).pop();
            },
          ),
          bottom: TabBar(
              labelColor: Theme.of(context).canvasColor,
              enableFeedback: true,
              indicatorWeight: SizeConfig.defaultSize! * .5,
              unselectedLabelColor: Theme.of(context).disabledColor,
              unselectedLabelStyle: Theme.of(context).textTheme.bodyLarge,
              indicatorSize: TabBarIndicatorSize.tab,
              labelStyle: Theme.of(context).textTheme.titleLarge,
              tabs: const [
                Tab(
                  child: Text("People"),
                ),
                Tab(
                  child: Text("Project"),
                )
              ]),
        ),
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: SizeConfig.defaultSize! * 1),
          child: TabBarView(children: [
            ListView(
              children: [
                const VirticalSpace(1),
                BlocBuilder<FavoritesBloc, FavoritesState>(
                  builder: (context, state) {
                    if (state is FavoritesLoading) {
                      return const Center(child: CustomLoading());
                    } else if (state is GetFavoriteUserSuccess) {
                      if (state.users.isEmpty) {
                        return const CustomEmpty();
                      } else {
                        return ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
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
                    } else if (state is FavoritesFailure) {
                      return Center(child: Text(state.errMessage));
                    } else {
                      return const Center(child: Text("Not Found"));
                    }
                  },
                ),
              ],
            ),
            ListView(
              children: [
                const VirticalSpace(.5),
                BlocBuilder<FavoritesBloc, FavoritesState>(
                  builder: (context, state) {
                    if (state is FavoritesLoading) {
                      return const Center(child: CustomLoading());
                    } else if (state is GetFavoriteProjectSuccess) {
                      if (state.projects.isEmpty) {
                        return const CustomEmpty();
                      } else {
                        return ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: state.projects.length,
                          itemBuilder: (context, index) {
                            return CustomProjectCard(
                                project: state.projects[index]);
                          },
                        );
                      }
                     
                    } else if (state is FavoritesFailure) {
                       
                      return Center(child: Text(state.errMessage));
                    } else {
                      return const Center(child: Text("Not Found"));
                    }
                  },
                ),
              ],
            )
          ]),
        ),
      ),
    );
  }
}
