import 'package:flutter/material.dart';
import 'package:freelance_job_portal/core/utils/size_config.dart';
import 'package:freelance_job_portal/features/onboarding/presentation/views/widget/onboarding_body.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
     SizeConfig().init(context);
    return const Scaffold(
      body: OnboardingBody(),
    );
  }
}
