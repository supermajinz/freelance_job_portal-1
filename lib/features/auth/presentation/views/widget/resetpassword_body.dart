import 'package:flutter/material.dart';
import 'package:freelance_job_portal/core/constants/colors.dart';
import 'package:freelance_job_portal/core/utils/functions/validinput.dart';
import 'package:freelance_job_portal/features/auth/presentation/views/widget/custom_button_auth.dart';
import 'package:freelance_job_portal/core/widget/custom_title.dart';
import 'package:freelance_job_portal/core/widget/space.dart';
import 'package:freelance_job_portal/features/auth/presentation/views/widget/custom_text_form.dart';
import 'package:go_router/go_router.dart';

class ResetpasswordBody extends StatelessWidget {
  const ResetpasswordBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
       const VirticalSpace(5),
        const Center(
            child: CustomTitle(
                size: 25, text: "Reset Password", color: primaryColer)),
        const VirticalSpace(4),
        const Text("New Password",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
            textAlign: TextAlign.center),
        const VirticalSpace(2),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: const Text(
              "please Enter New Password",
              style: TextStyle(fontSize: 15),
              textAlign: TextAlign.center),
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
        
              const VirticalSpace(32),
               CustomButton(
            onPressed: () {
              GoRouter.of(context).push("/");
            },
            color: const Color.fromARGB(255, 80, 34, 88),
            textcolor: Colors.white,
            text: "Reset Password",
            borderSide: const BorderSide(width: 0),
            width: 20)
    ],);
  }
}