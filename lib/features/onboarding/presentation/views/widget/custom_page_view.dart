import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:freelance_job_portal/features/onboarding/presentation/views/widget/page_view_item.dart';

class CustomPageView extends StatelessWidget {
  const CustomPageView({super.key, required this.pageController});
  final PageController? pageController;
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      children: const [
        PageViewItem(
            disc:
                "نحن نبحث عن مطور برامج لإنشاء نظام تأهيل تفاعلي لموظفينا الجدد. يجب أن يتضمن النظام معلومات عن الشركة والأدوات المستخدمة",
            image: "assets/images/o1.png"),
        PageViewItem(
            disc:
                "نحن بحاجة إلى مصمم تعليمي لإنشاء دورة تدريبية عبر الإنترنت للموظفين الجدد لدينا. يجب أن تتضمن الدورة مقاطع فيديو تعليمية وشرائح تفاعلية واختبارات للتقييم",
            image: "assets/images/o2.png"),
        PageViewItem(
            disc:
                "نحن نبحث عن متخصص في تجربة المستخدم لتحسين عملية الإعداد لمستخدمي التطبيق لدينا. يجب أن يهدف المشروع إلى جعل عملية التسجيل واستخدام التطبيق أكثر سلاسة",
            image: "assets/images/o3.jpg")
      ],
    );
  }
}
