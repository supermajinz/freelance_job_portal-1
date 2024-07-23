import 'package:flutter/material.dart';
import 'package:freelance_job_portal/core/utils/size_config.dart';
import 'package:freelance_job_portal/core/widget/custom_button_general.dart';
import 'package:freelance_job_portal/core/widget/custom_sub_title.dart';
import 'package:freelance_job_portal/core/widget/custom_text_form_general.dart';
import 'package:freelance_job_portal/core/widget/custom_title.dart';
import 'package:freelance_job_portal/core/widget/space.dart';
import 'package:freelance_job_portal/features/review/presentation/views/widget/custom_rating.dart';

class ReviewBody extends StatelessWidget {
  const ReviewBody({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return ListView(
      children: [
        Container(
          margin: EdgeInsets.symmetric(
              horizontal: SizeConfig.defaultSize! * 1.5,
              vertical: SizeConfig.defaultSize! * 2),
          child: Column(
            children: [
              const Center(
                child: CustomTitle(
                  text: "Review Ahmad",
                ),
              ),
              const VirticalSpace(5),
              const CustomSubTitle(
                text: "Overrall rating",
              ),
              const VirticalSpace(1),
              const CustomRating(),
              const VirticalSpace(3),
              const CustomSubTitle(
                text: "Proficieny rating",
              ),
              const VirticalSpace(1),
              const CustomRating(),
              const VirticalSpace(3),
              const CustomSubTitle(
                text: "Communication rating",
              ),
              const VirticalSpace(1),
              const CustomRating(),
              const VirticalSpace(3),
              const CustomSubTitle(
                text: "Quality rating",
              ),
              const VirticalSpace(1),
              const CustomRating(),
              const VirticalSpace(5),
              const CustomTextFormGeneral(
                  hinttext: "",
                  lable: "Describe your experience",
                  isNumber: false),
              const VirticalSpace(8),
              Center(
                  child: CustomButtonGeneral(
                      onPressed: () {},
                      color: Theme.of(context).primaryColor,
                      textcolor: Colors.white,
                      text: "Send",
                      borderSide: const BorderSide(width: 0),
                      width: SizeConfig.defaultSize! * 20)),
            ],
          ),
        )
      ],
    );
  }
}
