import 'package:flutter/material.dart';
import 'package:freelance_job_portal/features/auth/presentation/views/widget/verification_signup_body.dart';

class VerificationSignup extends StatelessWidget {
  const VerificationSignup({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: VerificationSignupBody()),
    );
  }
}
