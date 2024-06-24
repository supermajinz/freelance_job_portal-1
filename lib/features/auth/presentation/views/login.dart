import 'package:flutter/material.dart';
import 'package:freelance_job_portal/features/auth/presentation/views/widget/login_body.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: LoginBody(),
    );
  }
}
