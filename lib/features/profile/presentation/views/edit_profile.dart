import 'package:flutter/material.dart';
import 'package:freelance_job_portal/core/widget/custom_icon_back.dart';
import 'package:freelance_job_portal/core/widget/custom_title.dart';
import 'package:freelance_job_portal/features/profile/presentation/views/widget/edit_profile_body.dart';
import 'package:go_router/go_router.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomTitle(
          text: 'Edit Profile',
          white: true,
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
        leading: CustomIconBack(
          onPressed: () {
            GoRouter.of(context).pop();
          },
        ),
      ),
      body: const SafeArea(child: EditProfileBody()),
    );
  }
}
