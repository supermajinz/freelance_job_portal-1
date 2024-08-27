import 'dart:async';
import 'package:flutter/material.dart';
import 'package:freelance_job_portal/core/utils/size_config.dart';
import 'package:freelance_job_portal/features/onboarding/presentation/views/widget/custom_indcator.dart';
import 'package:freelance_job_portal/features/onboarding/presentation/views/widget/custom_page_view.dart';
import 'package:freelance_job_portal/core/widget/custom_button_general.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelance_job_portal/features/auth/presentation/view_models/bloc/auth_bloc.dart';

class OnboardingBody extends StatefulWidget {
  const OnboardingBody({super.key});

  @override
  State<OnboardingBody> createState() => _OnboardingBodyState();
}

class _OnboardingBodyState extends State<OnboardingBody> {
  PageController? pageController;
  Timer? _timer;

  @override
  void initState() {
    pageController = PageController(initialPage: 0)
      ..addListener(() {
        setState(() {});
      });

    // البدء بتشغيل المؤقت للتنقل التلقائي
    _startAutoSlide();
    super.initState();
  }

  void _startAutoSlide() {
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      if (pageController!.page! < 2) {
        pageController?.nextPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      } else {
        pageController?.animateToPage(
          0,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  void _stopAutoSlide() {
    _timer?.cancel();
  }

  @override
  void dispose() {
    _timer?.cancel();
    pageController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            _stopAutoSlide(); // إيقاف التنقل التلقائي عند التفاعل
          },
          onPanUpdate: (details) {
            _stopAutoSlide(); // إيقاف التنقل التلقائي عند السحب
          },
          onPanEnd: (details) {
            _startAutoSlide(); // إعادة تشغيل التنقل التلقائي بعد التفاعل
          },
          child: CustomPageView(
            pageController: pageController,
          ),
        ),
        Positioned(
          bottom: SizeConfig.defaultSize! * 21.5,
          left: 0,
          right: 0,
          child: CustomIndcator(
            dotIndex: pageController!.hasClients ? pageController?.page : 0,
          ),
        ),
        Positioned(
          bottom: SizeConfig.defaultSize! * 14.5,
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
          ),
        ),
        Positioned(
          bottom: SizeConfig.defaultSize! * 9,
          left: SizeConfig.defaultSize! * 8,
          child: CustomButtonGeneral(
            onPressed: () {
              GoRouter.of(context).push("/login");
            },
            width: SizeConfig.defaultSize! * 25.5,
            borderSide: const BorderSide(width: 0),
            color: Theme.of(context).colorScheme.secondary,
            text: "تسجيل دخول",
            textcolor: Colors.white,
          ),
        ),
        Positioned(
          bottom: SizeConfig.defaultSize! * 3.5,
          left: SizeConfig.defaultSize! * 8,
          child: CustomButtonGeneral(
            onPressed: () {
              context.read<AuthBloc>().add(ContinueAsGuestEvent());
              GoRouter.of(context).push("/homescreen");
            },
            width: SizeConfig.defaultSize! * 25.5,
            borderSide: const BorderSide(width: 1, color: Colors.grey),
            color: Colors.white,
            text: "الاستمرار كضيف",
            textcolor: Colors.black,
          ),
        ),
      ],
    );
  }
}
