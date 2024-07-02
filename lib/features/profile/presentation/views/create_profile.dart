import 'package:flutter/material.dart';
import 'package:freelance_job_portal/features/profile/presentation/views/widget/create_profile_body.dart';

class CreateProfile extends StatelessWidget {
  const CreateProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Profile'),centerTitle: true,
      ),
      body: const SafeArea(child: CreateProfileBody()),
    );
  }
}
