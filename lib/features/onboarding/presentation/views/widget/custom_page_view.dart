import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:freelance_job_portal/features/onboarding/presentation/views/widget/page_view_item.dart';

class CustomPageView extends StatelessWidget {
  const CustomPageView({super.key,required this.pageController});
 final PageController? pageController;
  @override
  Widget build(BuildContext context) {
    return PageView( 
      controller:pageController ,
      children: const [
      PageViewItem(disc: "We are looking for a software developer to create an interactive onboarding system for our new employees. The system should include information about the company, the tools used", image: "assets/images/o1.png"),
      PageViewItem(disc: "We need an instructional designer to create an online training course for our new hires. The course should include educational videos, interactive slides, and quizzes to assess", image: "assets/images/o2.png"),
      PageViewItem(disc: "We are seeking a UX specialist to improve the onboarding process for our app users. The project should aim to make the registration and app usage process smoother", image: "assets/images/o3.jpg")
    ],);
  }
}