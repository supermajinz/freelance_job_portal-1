import 'package:flutter/material.dart';
import 'package:freelance_job_portal/core/utils/size_config.dart';
import 'package:freelance_job_portal/core/widget/custom_button_general.dart';
import 'package:freelance_job_portal/core/widget/custom_edit_meony_general.dart';
import 'package:freelance_job_portal/core/widget/custom_sub_title.dart';
import 'package:freelance_job_portal/core/widget/space.dart';
import 'package:freelance_job_portal/features/profile/presentation/views/widget/edit_text_form.dart';

class EditOfferBody extends StatelessWidget {
  const EditOfferBody({super.key});

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
            const EditTextForm(
                // initvalue:
                // "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce fermentum lacus metus. Vivamus faucibus ullamcorper velit, id facilisis lacus tempus.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce fermentum lacus metus. Vivamus faucibus ullamcorper velit, id facilisis lacus tempus.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce fermentum lacus metus. Vivamus faucibus ullamcorper velit, id facilisis lacus tempus.",
                hinttext: "",
                lable: "Discripion",
                isNumber: false),
            const VirticalSpace(3),
            const EditTextForm(
                // initvalue:
                // "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce fermentum lacus metus. Vivamus faucibus ullamcorper velit, id facilisis lacus tempus.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce fermentum lacus metus. Vivamus faucibus ullamcorper velit, id facilisis lacus tempus.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce fermentum lacus metus. Vivamus faucibus ullamcorper velit, id facilisis lacus tempus.",
                hinttext: "",
                lable: "Delivery Time",
                isNumber: false),
            const VirticalSpace(4),
            const CustomSubTitle(text: "Budget"),
            const VirticalSpace(1),
            const CustomEditMeonyGeneral(
              // initVal: "7.500.00",
              isNumber: true,
            ),
            const VirticalSpace(36),
            CustomButtonGeneral(
                onPressed: () {},
                color: Theme.of(context).primaryColor,
                textcolor: Colors.white,
                text: "Save",
                borderSide: const BorderSide(),
                width: SizeConfig.defaultSize! * 20)
          ],
        ),
      )
    ]);
  }
}
