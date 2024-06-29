import 'package:flutter/material.dart';
import 'package:freelance_job_portal/core/utils/size_config.dart';
import 'package:freelance_job_portal/features/auth/presentation/views/widget/custom_auth_title.dart';
import 'package:freelance_job_portal/features/auth/presentation/views/widget/custom_button_auth.dart';
import 'package:freelance_job_portal/core/widget/custom_title.dart';
import 'package:freelance_job_portal/core/widget/space.dart';
import 'package:freelance_job_portal/features/auth/presentation/views/widget/otp_text_field.dart';
import 'package:go_router/go_router.dart';

class VerificationCodeBody extends StatelessWidget {
  const VerificationCodeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const VirticalSpace(5),
        const Center(child: CustomAuthTitle(text: "Verification Code")),
        const VirticalSpace(4),
        const Center(
          child: CustomTitle(
            text: "Cheek Code",
          ),
        ),
        const VirticalSpace(2),
        Container(
          margin: EdgeInsets.symmetric(horizontal: SizeConfig.defaultSize! * 1),
          child: const Text("please Enter The Digit Code",
              style: TextStyle(fontSize: 18), textAlign: TextAlign.center),
        ),
        const VirticalSpace(6),
        const OtpTextFieldVer(),
        const VirticalSpace(1),
        const Text("Resend",
            style:
                TextStyle(fontSize: 16, decoration: TextDecoration.underline),
            textAlign: TextAlign.center),
        const VirticalSpace(35),
        CustomButton(
            onPressed: () {
              GoRouter.of(context).push("/resetpassword");
            },
            color: Theme.of(context).primaryColor,
            textcolor: Colors.white,
            text: "Ckeek",
            borderSide: const BorderSide(width: 0),
            width: SizeConfig.defaultSize! * 2)
      ],
    );
  }
}
