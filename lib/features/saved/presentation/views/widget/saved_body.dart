import 'package:flutter/material.dart';
import 'package:freelance_job_portal/core/utils/size_config.dart';
import 'package:freelance_job_portal/core/widget/custom_icon_back.dart';
import 'package:freelance_job_portal/core/widget/custom_title.dart';
import 'package:freelance_job_portal/core/widget/space.dart';
import 'package:freelance_job_portal/features/projects/presentation/views/widget/custom_project_card.dart';
import 'package:freelance_job_portal/features/saved/presentation/views/widget/custom_saved_card.dart';
import 'package:go_router/go_router.dart';

import '../../../../projects/data/model/project_model/project_model.dart';

class SavedBody extends StatelessWidget {
  const SavedBody({super.key});

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
          child: TabBarView(children: [
            ListView(
              children: [
                const VirticalSpace(1),
                ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  separatorBuilder: (context, index) {
                    return const VirticalSpace(.5);
                  },
                  itemCount: 7,
                  itemBuilder: (context, index) {
                    return const CustomSavedCard(
                      icon: Icons.bookmark_add,
                    );
                  },
                ),
              ],
            ),
            ListView(
              children: [
                const VirticalSpace(.5),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return CustomProjectCard(project: ProjectModel());
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
