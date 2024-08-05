import 'package:flutter/material.dart';
import 'package:freelance_job_portal/core/utils/size_config.dart';
import 'package:freelance_job_portal/core/widget/custom_icon_back.dart';
import 'package:freelance_job_portal/core/widget/custom_title.dart';
import 'package:freelance_job_portal/features/projects/data/model/project_model/project_model.dart';
import 'package:freelance_job_portal/features/projects/presentation/views/widget/show_project_details_body.dart';
import 'package:go_router/go_router.dart';

class ShowProjectDetails extends StatelessWidget {
<<<<<<< HEAD
  const ShowProjectDetails({super.key, required this.project});
  final ProjectModel project;
=======
  const ShowProjectDetails({super.key, required this.projectId});

  final int projectId;
>>>>>>> c17aaecf2b0fcfb04115103d45cd839bcaa27f6f

  @override
  Widget build(BuildContext context) {
    print(projectId);
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
          title: const CustomTitle(
            text: 'Project Details',
            white: true,
          ),
          centerTitle: true,
          backgroundColor: Theme.of(context).primaryColor,
          leading: CustomIconBack(
            onPressed: () {
              GoRouter.of(context).pop();
            },
          )),
<<<<<<< HEAD
      body: SafeArea(child: ShowProjectDetailsBody(project: project)),
=======
      body: SafeArea(child: ShowProjectDetailsBody(projectId: projectId)),
>>>>>>> c17aaecf2b0fcfb04115103d45cd839bcaa27f6f
    );
  }
}
