import 'package:flutter/material.dart';
import 'package:freelance_job_portal/features/auth/presentation/views/widget/verification_code_body.dart';

class VerificationCode extends StatelessWidget {
  const VerificationCode({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: VerificationCodeBody(),
    );
  }
}
