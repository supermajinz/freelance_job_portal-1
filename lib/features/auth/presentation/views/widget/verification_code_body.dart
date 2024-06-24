import 'package:flutter/material.dart';
import 'package:freelance_job_portal/core/constants/colors.dart';
import 'package:freelance_job_portal/core/widget/custom_button.dart';
import 'package:freelance_job_portal/core/widget/custom_title.dart';
import 'package:freelance_job_portal/core/widget/space.dart';
import 'package:freelance_job_portal/features/auth/presentation/views/widget/otp_text_field.dart';
import 'package:go_router/go_router.dart';

class VerificationCodeBody extends StatelessWidget {
  const VerificationCodeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
       const VirticalSpace(5),
        const Center(
            child: CustomTitle(
                size: 25, text: "Verification Code", color: primaryColer)),
        const VirticalSpace(4),
        const Text("Cheek Code",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
            textAlign: TextAlign.center),
        const VirticalSpace(2),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: const Text(
              "please Enter The Digit Code",
              style: TextStyle(fontSize: 15),
              textAlign: TextAlign.center),
        ),
        const VirticalSpace(6),
        const OtpTextFieldVer(),
        const VirticalSpace(1),
         const Text(
             "Resend",
             style: TextStyle(fontSize: 15),
             textAlign: TextAlign.center),
              const VirticalSpace(39),
               CustomButton(
            onPressed: () {
              GoRouter.of(context).push("/resetpassword");
            },
            color: const Color.fromARGB(255, 80, 34, 88),
            textcolor: Colors.white,
            text: "Ckeek",
            borderSide: const BorderSide(width: 0),
            width: 20)
    ],)
    ;
  }
}
