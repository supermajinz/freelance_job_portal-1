import 'package:flutter/material.dart';
import 'package:freelance_job_portal/core/utils/size_config.dart';
import 'package:freelance_job_portal/features/profile/presentation/views/widget/edit_profile_body.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
     SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
      ),
      body: const EditProfileBody(),
    );
  }
}