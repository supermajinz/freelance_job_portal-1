import 'package:flutter/material.dart';
import 'package:freelance_job_portal/core/utils/size_config.dart';
import 'package:freelance_job_portal/core/widget/custom_button_general.dart';
import 'package:freelance_job_portal/core/widget/custom_text_form_general.dart';
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
                child: Text(
                  "Review Ahmad",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
              const VirticalSpace(5),
              const Text(
                "Overrall rating",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              const VirticalSpace(1),
              const CustomRating(),
              const VirticalSpace(3),
              const Text(
                "Proficieny rating",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              const VirticalSpace(1),
              const CustomRating(),
              const VirticalSpace(3),
              const Text(
                "Communication rating",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              const VirticalSpace(1),
              const CustomRating(),
              const VirticalSpace(3),
              const Text(
                "Quality rating",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
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
