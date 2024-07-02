import 'package:flutter/material.dart';
import 'package:freelance_job_portal/core/utils/size_config.dart';
import 'package:freelance_job_portal/core/widget/custom_button_general.dart';
import 'package:freelance_job_portal/features/onboarding/presentation/views/widget/custom_indcator.dart';
import 'package:freelance_job_portal/features/onboarding/presentation/views/widget/custom_page_view.dart';
import 'package:go_router/go_router.dart';

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
            bottom: SizeConfig.defaultSize! * 19,
            left: 0,
            right: 0,
            child: CustomIndcator(
              dotIndex: pageController!.hasClients ? pageController?.page : 0,
            )),
        Positioned(
            bottom: SizeConfig.defaultSize! * 12,
            left: SizeConfig.defaultSize! * 8,
            child: CustomButtonGeneral(
              onPressed: () {
                GoRouter.of(context).push("/signup");
              },
              width: SizeConfig.defaultSize! * 25.5,
              borderSide: const BorderSide(width: 0),
              color: Theme.of(context).primaryColor,
              text: "انشاء حساب",
              textcolor: Colors.white,
            )),
        Positioned(
            bottom: SizeConfig.defaultSize! * 6.5,
            left: SizeConfig.defaultSize! * 8,
            child: CustomButtonGeneral(
              onPressed: () {
                GoRouter.of(context).push("/login");
              },
              width: SizeConfig.defaultSize! * 25.5,
              borderSide: const BorderSide(width: 0),
              color: Colors.cyanAccent,
              text: "تسجيل دخول",
              textcolor: Colors.white,
            )),
        Positioned(
            bottom: SizeConfig.defaultSize! * 1,
            left: SizeConfig.defaultSize! * 8,
            child: CustomButtonGeneral(
              onPressed: () {
                GoRouter.of(context).push("/home");
              },
              width: SizeConfig.defaultSize! * 25.5,
              borderSide: const BorderSide(width: 1),
              color: Colors.white,
              text: "الاستمرار كضيف",
              textcolor: Colors.black,
            )),
      ],
    );
  }
}
