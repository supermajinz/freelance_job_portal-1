import 'package:flutter/material.dart';
import 'package:freelance_job_portal/features/profile/presentation/views/widget/profile_body.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ProfileBody(),
    );
  }
}