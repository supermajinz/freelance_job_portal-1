import 'package:flutter/material.dart';
import 'package:freelance_job_portal/core/constants/colors.dart';
import 'package:freelance_job_portal/core/utils/functions/validinput.dart';
import 'package:freelance_job_portal/features/auth/presentation/views/widget/custom_button_auth.dart';
import 'package:freelance_job_portal/core/widget/custom_title.dart';
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
        const Center(
            child: CustomTitle(size: 25, text: "Sign Up", color: primaryColer)),
        const VirticalSpace(4),
        const Text("Welcom Back",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
            textAlign: TextAlign.center),
        const VirticalSpace(2),
        const Text("Sign Up With Phone Number and Password",
            style: TextStyle(fontSize: 15), textAlign: TextAlign.center),
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
        const VirticalSpace(10),
        CustomButton(
            onPressed: () {
              GoRouter.of(context).push("/verificationsignup");
            },
            color: const Color.fromARGB(255, 80, 34, 88),
            textcolor: Colors.white,
            text: "Sign Up",
            borderSide: const BorderSide(width: 0),
            width: 20),
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
