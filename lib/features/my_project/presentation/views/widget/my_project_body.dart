import 'package:flutter/material.dart';
import 'package:freelance_job_portal/core/utils/size_config.dart';
import 'package:freelance_job_portal/features/my_project/presentation/views/widget/custom_project_status.dart';

class MyProjectBody extends StatelessWidget {
  const MyProjectBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 3,
      itemBuilder: (context, index) {
        return Container(
            margin:
                EdgeInsets.symmetric(horizontal: SizeConfig.defaultSize! * 0.5),
            child: const CustomProjectStatus());
      },
    );
  }
}
