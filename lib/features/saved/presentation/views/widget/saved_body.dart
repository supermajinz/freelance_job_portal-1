import 'package:flutter/material.dart';
import 'package:freelance_job_portal/core/utils/size_config.dart';
import 'package:freelance_job_portal/core/widget/space.dart';
import 'package:freelance_job_portal/features/home/presentation/views/widget/custom_project_card.dart';
import 'package:freelance_job_portal/features/profile/presentation/views/widget/custom_profile_card.dart';
import 'package:freelance_job_portal/features/saved/presentation/views/widget/custom_people.dart';

class SavedBody extends StatelessWidget {
  const SavedBody({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Saved items'),
          centerTitle: true,
          leading:
              IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_back)),
          bottom: const TabBar(
              indicatorSize: TabBarIndicatorSize.tab,
              labelStyle: TextStyle(fontSize: 20),
              tabs: [
                Tab(
                  child: Text("People"),
                ),
                Tab(
                  child: Text("Project"),
                )
              ]),
        ),
        body: Container(
          margin: EdgeInsets.symmetric(
              vertical: SizeConfig.defaultSize! * .5,
              horizontal: SizeConfig.defaultSize! * .5),
          child: TabBarView(children: [
            ListView.separated(
              separatorBuilder: (context, index) {
                return const VirticalSpace(.5);
              },
              itemCount: 3,
              itemBuilder: (context, index) {
                return const CustomProfileCard();
              },
            ),
            ListView.builder(
              itemCount: 3,
              itemBuilder: (context, index) {
                return const CustomProjectCard();
              },
            )
          ]),
        ),
      ),
    );
  }
}
