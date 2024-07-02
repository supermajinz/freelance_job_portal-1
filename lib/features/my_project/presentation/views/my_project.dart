import 'package:flutter/material.dart';
import 'package:freelance_job_portal/core/utils/size_config.dart';
import 'package:freelance_job_portal/features/my_project/presentation/views/widget/my_project_body.dart';

class MyProject extends StatelessWidget {
  const MyProject({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Project'),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {},
            icon: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(SizeConfig.defaultSize!*.5),
                    border: Border.all(width: SizeConfig.defaultSize!*.1)),
                child: const Icon(Icons.arrow_back, size: 25))),
      ),
      body: const SafeArea(child: MyProjectBody()),
    );
  }
}
