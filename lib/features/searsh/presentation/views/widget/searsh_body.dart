import 'package:flutter/material.dart';
import 'package:freelance_job_portal/core/utils/size_config.dart';
import 'package:freelance_job_portal/core/widget/space.dart';
import 'package:freelance_job_portal/features/projects/data/model/project_model/project_model.dart';
import 'package:freelance_job_portal/features/projects/presentation/views/widget/custom_project_card.dart';
import 'package:freelance_job_portal/features/searsh/presentation/views/widget/custom_chip_searsh.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/widget/custom_search.dart';

class SearshBody extends StatelessWidget {
  const SearshBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      const CustomSearch(
        title: "ابحث....",
      ),
      Padding(
        padding: EdgeInsets.only(left: SizeConfig.defaultSize! * 1),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: () {
                  GoRouter.of(context).push("/sort");
                },
                icon: Icon(
                  Icons.sort,
                  size: SizeConfig.defaultSize! * 3,
                )),
            Wrap(
              spacing: SizeConfig.defaultSize! * .5,
              children: const [
                CustomChipSearsh(
                  text: "Flutter",
                ),
                CustomChipSearsh(
                  text: "10 - 25 MSP",
                ),
                CustomChipSearsh(
                  text: "Design",
                )
              ],
            ),
          ],
        ),
      ),
      const VirticalSpace(1),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: SizeConfig.defaultSize! * 1),
        child: ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 4,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return CustomProjectCard(project: ProjectModel());
          },
        ),
      ),
    ]);
  }
}
