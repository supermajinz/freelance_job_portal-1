import 'package:flutter/material.dart';
import 'package:freelance_job_portal/core/utils/size_config.dart';
import 'package:freelance_job_portal/core/widget/custom_icon_back.dart';
import 'package:freelance_job_portal/core/widget/custom_title.dart';
import 'package:freelance_job_portal/features/projects/data/model/project_model/project_model.dart';
import 'package:freelance_job_portal/features/projects/presentation/views/widget/show_project_details_body.dart';
import 'package:go_router/go_router.dart';

class ShowProjectDetails extends StatelessWidget {
  const ShowProjectDetails({super.key, required this.project});
  final ProjectModel project;

  @override
  Widget build(BuildContext context) {
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
      body: SafeArea(child: ShowProjectDetailsBody(project: project)),
    );
  }
}
