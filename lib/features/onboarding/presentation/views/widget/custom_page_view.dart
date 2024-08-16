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
               "انضم إلى منصتنا، حيث يمكنك عرض مهاراتك للعمل مع أصحاب المشاريع الذين يبحثون عن محترفين لتنفيذ أفكارهم.",
            image: "assets/lottie/onb4.json"),
        PageViewItem(
            disc:
                "ابدأ العمل على مشاريع متنوعة ينشرها أصحاب العمل، وكن جزءًا من رحلة تحويل أفكارهم إلى واقع.",
            image: "assets/lottie/onb2.json"),
        PageViewItem(
            disc:
                "تواصل مع أصحاب المشاريع مباشرة، وقدم عروضك على المشاريع التي تتناسب مع خبراتك وابدأ العمل الحر الآن.",
            image: "assets/lottie/onb3.json")
      ],
    );
  }
}
