import 'package:flutter/material.dart';

import '../../../../../core/utils/size_config.dart';
import '../../../../../core/widget/space.dart';
import '../../../data/model/caregories/caregories.dart';

class CustomCartegoryCard extends StatelessWidget {
  const CustomCartegoryCard({super.key, required this.cat});
  final Categories cat;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(SizeConfig.defaultSize! * 1),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 168, 143, 237),
            borderRadius:
                BorderRadius.all(Radius.circular(SizeConfig.defaultSize! * 1)),
          ),
          child: Image.asset(getImageForCategory(cat.id), 
              height: SizeConfig.defaultSize! * 6,
              width: SizeConfig.defaultSize! * 6,
              fit: BoxFit.fill),
        ),
        const VirticalSpace(1),
        SizedBox(
          width: SizeConfig.defaultSize! * 12,
          child: Text(
            cat.name,
            textAlign: TextAlign.center,
            maxLines: 3,
            style: Theme.of(context).textTheme.labelLarge,
          ),
        ),
      ],
    );
  }
}

String getImageForCategory(dynamic categoryId) {
  switch (categoryId.toString()) {
    // تحويل id إلى String
    case '1':
      return 'assets/images/consultant-services.png'; // أعمال وخدمات استشارية
    case '2':
      return 'assets/images/developer.png'; // برمجة وتطوير المواقع
    case '3':
      return 'assets/images/drafting.png'; // هندسة عمارة وتصميم داخلي
    case '4':
      return 'assets/images/video-editor.png'; // تصميم فيديو وصوتيات
    case '5':
      return 'assets/images/marketing.png'; // تسويق الكتروني ومبيعات
    case '6':
      return 'assets/images/notes.png'; // كتابة وترجمة لغات
    case '7':
      return 'assets/images/service.png'; // دعم وادخال بيانات
    case '8':
      return 'assets/images/video-conference.png'; // تدريب وتعليم عن بعد
    // أضف المزيد من الحالات بناءً على التصنيفات الموجودة لديك
    default:
      return 'assets/images/default.png'; // صورة افتراضية
  }
}
