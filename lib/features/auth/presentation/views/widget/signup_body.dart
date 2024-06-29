import 'package:flutter/material.dart';
import 'package:freelance_job_portal/core/utils/functions/validinput.dart';
import 'package:freelance_job_portal/core/utils/size_config.dart';
import 'package:freelance_job_portal/core/widget/custom_body_medium.dart';
import 'package:freelance_job_portal/core/widget/custom_title.dart';
import 'package:freelance_job_portal/features/auth/presentation/views/widget/custom_auth_title.dart';
import 'package:freelance_job_portal/features/auth/presentation/views/widget/custom_button_auth.dart';
import 'package:freelance_job_portal/core/widget/space.dart';
import 'package:freelance_job_portal/features/auth/presentation/views/widget/custom_text_form.dart';
import 'package:freelance_job_portal/features/auth/presentation/views/widget/custom_text_signup.dart';
import 'package:go_router/go_router.dart';

class SignupBody extends StatelessWidget {
  const SignupBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
        child: ListView(
      children: [
        const VirticalSpace(5),
        const Center(child: CustomAuthTitle(text: "Sign Up")),
        const VirticalSpace(4),
        const Center(child: CustomTitle(text: "Welcom Back")),
        const VirticalSpace(2),
        const Center(
          child: CustomBodyMedium(
            text: "Sign Up With Phone Number and Password",
          ),
        ),
        const VirticalSpace(6),
        Row(children: [
          Expanded(
            child: CustomTextForm(
              hinttext: "",
              lable: "First Name",
              icon: Icons.person_2_outlined,
              isNumber: false,
              valid: (p0) {
                return validInput(p0!, 5, 8, "firstname");
              },
            ),
          ),
          Expanded(
            child: CustomTextForm(
              hinttext: "",
              lable: "Last Name",
              icon: Icons.person_2_outlined,
              isNumber: false,
              valid: (p0) {
                return validInput(p0!, 5, 8, "lastname");
              },
            ),
          ),
        ]),
        CustomTextForm(
          hinttext: "Enter Your Phone Number",
          lable: "Phone Number",
          icon: Icons.phone_android_outlined,
          isNumber: true,
          valid: (p0) {
            return validInput(p0!, 5, 15, "phonenumber");
          },
        ),
        CustomTextForm(
          hinttext: "Enter Your Email",
          lable: "Email",
          icon: Icons.email_outlined,
          isNumber: false,
          valid: (email) {
            return validInput(email!, 5, 30, "email");
          },
        ),
        CustomTextForm(
          hinttext: "Enter Your Password",
          lable: "Password",
          icon: Icons.lock_outline,
          isNumber: false,
          valid: (password) {
            return validInput(password!, 5, 30, "password");
          },
        ),
        const VirticalSpace(12.5),
        CustomButton(
            onPressed: () {
              GoRouter.of(context).push("/verificationsignup");
            },
            color: Theme.of(context).primaryColor,
            textcolor: Colors.white,
            text: "Sign Up",
            borderSide: const BorderSide(width: 0),
            width: SizeConfig.defaultSize! * 2),
        const VirticalSpace(1),
        TextSignUp(
          text1: "Already have an account? ",
          text2: "Log in",
          onTap: () {
            GoRouter.of(context).push("/");
          },
        )
      ],
    ));
  }
}
