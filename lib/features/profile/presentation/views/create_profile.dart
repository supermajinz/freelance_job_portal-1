import 'package:flutter/material.dart';
import 'package:freelance_job_portal/core/utils/size_config.dart';
import 'package:freelance_job_portal/features/profile/presentation/views/widget/create_profile_body.dart';

class CreateProfile extends StatelessWidget {
  const CreateProfile({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Profile'),
      ),
      body: const CreateProfileBody(),
    );
  }
}