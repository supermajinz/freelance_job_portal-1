import 'package:flutter/material.dart';
import 'package:freelance_job_portal/core/utils/size_config.dart';
import 'package:freelance_job_portal/core/widget/custom_button_general.dart';
import 'package:freelance_job_portal/core/widget/custom_meony_general.dart';
import 'package:freelance_job_portal/core/widget/custom_sub_title.dart';
import 'package:freelance_job_portal/core/widget/custom_text_form_general.dart';
import 'package:freelance_job_portal/core/widget/space.dart';
import 'package:freelance_job_portal/features/protofolio/presentaion/views/widget/custom_date.dart';

class CreateOfferBody extends StatelessWidget {
  const CreateOfferBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Container(
        margin: EdgeInsets.symmetric(
            horizontal: SizeConfig.defaultSize! * 1.5,
            vertical: SizeConfig.defaultSize! * 2),
        child: Column(
          children: [
            const VirticalSpace(4),
            const CustomTextFormGeneral(
                hinttext: "", lable: "Title", isNumber: false),
            const VirticalSpace(2),
            const CustomTextFormGeneral(
                hinttext: "", lable: "Discripion", isNumber: false),
            const VirticalSpace(6),
            const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      CustomSubTitle(text: "Price"),
                      VirticalSpace(2),
                      CustomMeonyGeneral(
                        isNumber: true,
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      CustomSubTitle(text: "Delivery Time"),
                      VirticalSpace(1),
                      CustomDate()
                    ],
                  ),
                )
              ],
            ),
            const VirticalSpace(33),
            CustomButtonGeneral(
                onPressed: () {},
                color: Theme.of(context).primaryColor,
                textcolor: Colors.white,
                text: "Send",
                borderSide: const BorderSide(),
                width: SizeConfig.defaultSize! * 20)
          ],
        ),
      )
    ]);
  }
}
