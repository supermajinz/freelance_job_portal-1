import 'package:flutter/material.dart';
import 'package:freelance_job_portal/core/utils/functions/show_buttom_sheet_auth.dart';
import 'package:freelance_job_portal/core/utils/size_config.dart';
import 'package:freelance_job_portal/features/auth/presentation/views/widget/custom_auth_title.dart';
import 'package:freelance_job_portal/features/auth/presentation/views/widget/custom_button_auth.dart';
import 'package:freelance_job_portal/core/widget/custom_title.dart';
import 'package:freelance_job_portal/core/widget/space.dart';
import 'package:freelance_job_portal/features/auth/presentation/views/widget/otp_text_field.dart';

class VerificationSignupBody extends StatelessWidget {
  const VerificationSignupBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const VirticalSpace(5),
        const Center(child: CustomAuthTitle(text: "Check Phone Number")),
        const VirticalSpace(4),
        const Center(child: CustomTitle(text: "Complete Sign Up")),
        const VirticalSpace(2),
        Container(
          margin:
              EdgeInsets.symmetric(horizontal: SizeConfig.defaultSize! * 1.5),
          child: const Text(
              "We have sent a code to your phone number,Please enter it below to complete signing up",
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center),
        ),
        const VirticalSpace(6),
        const OtpTextFieldVer(),
        const VirticalSpace(1),
        InkWell(
          onTap: () {},
          child: const Text(
            "Resend",
            style:
                TextStyle(fontSize: 16, decoration: TextDecoration.underline),
            textAlign: TextAlign.center,
          ),
        ),
        const VirticalSpace(29),
        CustomButton(
            onPressed: () {
              showButtomSheet(context,"Account successfully created");
            },
            color: const Color.fromARGB(255, 80, 34, 88),
            textcolor: Colors.white,
            text: "Ckeek",
            borderSide: const BorderSide(width: 0),
            width: SizeConfig.defaultSize! * 2)
      ],
    );
  }
}
