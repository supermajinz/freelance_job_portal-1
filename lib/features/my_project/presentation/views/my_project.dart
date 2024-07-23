import 'package:flutter/material.dart';
import 'package:freelance_job_portal/features/my_project/presentation/views/widget/my_project_body.dart';

class MyProject extends StatelessWidget {
  const MyProject({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: MyProjectBody()),
    );
  }
}
