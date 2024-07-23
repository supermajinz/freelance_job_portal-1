import 'package:flutter/material.dart';
import 'package:freelance_job_portal/features/my_project/presentation/views/widget/project_status_details_body.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/widget/custom_icon_back.dart';
import '../../../../core/widget/custom_title.dart';

class ProjectStatusDetails extends StatelessWidget {
  const ProjectStatusDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const CustomTitle(
            text: 'Project Status Details',
            white: true,
          ),
          centerTitle: true,
          backgroundColor: Theme.of(context).primaryColor,
          leading: CustomIconBack(
            onPressed: () {
              GoRouter.of(context).pop();
            },
          )),
      body: const SafeArea(child: ProjectStatusDetailsBody()),
    );
  }
}
