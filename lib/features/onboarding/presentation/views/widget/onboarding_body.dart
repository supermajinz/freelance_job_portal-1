import 'package:flutter/material.dart';
import 'package:freelance_job_portal/core/constants/colors.dart';
import 'package:freelance_job_portal/features/auth/presentation/views/widget/custom_button_auth.dart';
import 'package:freelance_job_portal/features/onboarding/presentation/views/widget/custom_indcator.dart';
import 'package:freelance_job_portal/features/onboarding/presentation/views/widget/custom_page_view.dart';

class OnboardingBody extends StatefulWidget {
  const OnboardingBody({super.key});

  @override
  State<OnboardingBody> createState() => _OnboardingBodyState();
}

class _OnboardingBodyState extends State<OnboardingBody> {
  PageController? pageController;
  @override
  void initState() {
    pageController = PageController(initialPage: 0)
      ..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomPageView(
          pageController: pageController,
        ),
        Positioned(
            bottom: 180,
            left: 0,
            right: 0,
            child: CustomIndcator(
              dotIndex: pageController!.hasClients ? pageController?.page : 0,
            )),
        const Positioned(
            bottom: 110,
            left: 80,
            child: CustomButton(
              width: 250,
              borderSide: BorderSide(width: 0),
              color: primaryColer,
              text: "SignUp",
              textcolor: Colors.white,
            )),
        const Positioned(
            bottom: 60,
            left: 80,
            child: CustomButton(
              width: 250,
              borderSide: BorderSide(width: 0),
              color: Colors.cyanAccent,
              text: "SignIn",
              textcolor: Colors.white,
            )),
        const Positioned(
            bottom: 10,
            left: 80,
            child: CustomButton(
              width: 250,
              borderSide: BorderSide(width: 1),
              color: Colors.white,
              text: "Continue As Guest",
              textcolor: Colors.black,
            )),
      ],
    );
  }
}
