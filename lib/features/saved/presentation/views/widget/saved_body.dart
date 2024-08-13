import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelance_job_portal/core/utils/size_config.dart';
import 'package:freelance_job_portal/core/widget/custom_icon_back.dart';
import 'package:freelance_job_portal/core/widget/custom_loading.dart';
import 'package:freelance_job_portal/core/widget/custom_title.dart';
import 'package:freelance_job_portal/core/widget/space.dart';
import 'package:freelance_job_portal/features/projects/presentation/views/widget/custom_project_card.dart';
import 'package:freelance_job_portal/features/saved/presentation/view_models/favorites_bloc/favorites_bloc.dart';
import 'package:freelance_job_portal/features/saved/presentation/views/widget/custom_saved_card.dart';
import 'package:freelance_job_portal/features/saved/presentation/views/widget/favorite_people.dart';
import 'package:freelance_job_portal/features/saved/presentation/views/widget/favorite_projects.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/widget/custom_empty.dart';
import '../../../../auth/presentation/view_models/bloc/auth_bloc.dart';

class SavedBody extends StatefulWidget {
  const SavedBody({super.key});

  @override
  State<SavedBody> createState() => _SavedBodyState();
}

class _SavedBodyState extends State<SavedBody> {
  @override
  void initState() {
    super.initState();
    if (context.read<FavoritesBloc>().state is FavoritesFailure) {
          final userId = (context.read<AuthBloc>().state as AuthAuthenticated).id;
      context.read<FavoritesBloc>().add(GetFavorite(userId));
    }
  }

  @override
  Widget build(BuildContext context) {
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
          child: const TabBarView(
              children: [FavoritePeople(), FavoriteProjects()]),
        ),
      ),
    );
  }
}
