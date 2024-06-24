import 'package:flutter/material.dart';
import 'package:freelance_job_portal/features/auth/presentation/views/widget/signup_body.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SignupBody(),
    );
  }
}
