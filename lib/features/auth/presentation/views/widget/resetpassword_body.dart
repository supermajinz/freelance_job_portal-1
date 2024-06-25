import 'package:flutter/material.dart';
import 'package:freelance_job_portal/core/utils/functions/show_buttom_sheet_auth.dart';
import 'package:freelance_job_portal/core/utils/functions/validinput.dart';
import 'package:freelance_job_portal/core/utils/size_config.dart';
import 'package:freelance_job_portal/features/auth/presentation/views/widget/custom_auth_title.dart';
import 'package:freelance_job_portal/features/auth/presentation/views/widget/custom_button_auth.dart';
import 'package:freelance_job_portal/core/widget/custom_title.dart';
import 'package:freelance_job_portal/core/widget/space.dart';
import 'package:freelance_job_portal/features/auth/presentation/views/widget/custom_text_form.dart';

class ResetpasswordBody extends StatelessWidget {
  const ResetpasswordBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const VirticalSpace(5),
        const Center(child: CustomAuthTitle(text: "Reset Password")),
        const VirticalSpace(4),
        const Center(
          child: CustomTitle(
            text: "New Password",
          ),
        ),
        const VirticalSpace(2),
        Container(
          margin: EdgeInsets.symmetric(horizontal: SizeConfig.defaultSize! * 1),
          child: const Text("please Enter New Password",
              style: TextStyle(fontSize: 18), textAlign: TextAlign.center),
        ),
        const VirticalSpace(6),
        CustomTextForm(
          hinttext: "Enter Your Password",
          lable: "Password",
          icon: Icons.lock_outline,
          isNumber: false,
          valid: (password) {
            return validInput(password!, 5, 30, "password");
          },
        ),
        CustomTextForm(
          hinttext: "Re Enter Your Password",
          lable: "Password",
          icon: Icons.lock_outline,
          isNumber: false,
          valid: (password) {
            return validInput(password!, 5, 30, "password");
          },
        ),
        const VirticalSpace(29),
        CustomButton(
            onPressed: () {
              showButtomSheet(context,"The password has been changed successfully");
            },
            color: Theme.of(context).primaryColor,
            textcolor: Colors.white,
            text: "Reset Password",
            borderSide: const BorderSide(width: 0),
            width: SizeConfig.defaultSize! * 2)
      ],
    );
  }
}
