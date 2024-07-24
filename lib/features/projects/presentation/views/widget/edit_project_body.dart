import 'package:flutter/material.dart';
import 'package:freelance_job_portal/core/utils/size_config.dart';
import 'package:freelance_job_portal/core/widget/custom_body_medium.dart';
import 'package:freelance_job_portal/core/widget/custom_button_general.dart';
import 'package:freelance_job_portal/core/widget/custom_edit_meony_general.dart';
import 'package:freelance_job_portal/core/widget/custom_sub_title.dart';
import 'package:freelance_job_portal/core/widget/space.dart';
import 'package:freelance_job_portal/features/profile/presentation/views/widget/custom_dropdown_searsh.dart';
import 'package:freelance_job_portal/features/profile/presentation/views/widget/edit_text_form.dart';
import 'package:freelance_job_portal/features/profile/presentation/views/widget/show_chip.dart';
import 'package:freelance_job_portal/features/protofolio/presentaion/views/widget/custom_date.dart';
import '../../../../profile/presentation/views/widget/custom_show_chip_button.dart';

class EditProjectBody extends StatelessWidget {
  const EditProjectBody({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return ListView(children: [
      Container(
        margin: EdgeInsets.symmetric(
            horizontal: SizeConfig.defaultSize! * 1.5,
            vertical: SizeConfig.defaultSize! * 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const VirticalSpace(4),
            const EditTextForm(
                initvalue: "Excited to work with you!",
                hinttext: "",
                lable: "Title",
                isNumber: false),
            const VirticalSpace(3),
            const EditTextForm(
                initvalue:
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce fermentum lacus metus. Vivamus faucibus ullamcorper velit, id facilisis lacus tempus.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce fermentum lacus metus. Vivamus faucibus ullamcorper velit, id facilisis lacus tempus.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce fermentum lacus metus. Vivamus faucibus ullamcorper velit, id facilisis lacus tempus.",
                hinttext: "",
                lable: "Discripion",
                isNumber: false),
            const VirticalSpace(6),
            const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      CustomSubTitle(text: "Budget"),
                      VirticalSpace(2),
                      CustomEditMeonyGeneral(
                        initVal: "7.500.00",
                        isNumber: true,
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      CustomSubTitle(text: "Deadline"),
                      VirticalSpace(1),
                      CustomDate(),
                      CustomBody(text: "14/4/2024")
                    ],
                  ),
                )
              ],
            ),
            const VirticalSpace(5),
            const CustomSubTitle(
              text: "Category",
            ),
            const VirticalSpace(1.5),
            const CustomDropdownSearsh1(),
            const VirticalSpace(5),
            const CustomSubTitle(
              text: "Skills",
            ),
            const VirticalSpace(1.5),
            const CustomDropdownSearsh1(),
            const VirticalSpace(2),
            const CustomShowChipButton(),
            const VirticalSpace(2),
            const ShowChip(),
            const VirticalSpace(7),
            Center(
              child: CustomButtonGeneral(
                  onPressed: () {},
                  color: Theme.of(context).primaryColor,
                  textcolor: Colors.white,
                  text: "Save",
                  borderSide: const BorderSide(),
                  width: SizeConfig.defaultSize! * 20),
            )
          ],
        ),
      )
    ]);
  }
}
