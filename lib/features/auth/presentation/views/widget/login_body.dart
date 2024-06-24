import 'package:flutter/material.dart';
import 'package:freelance_job_portal/core/constants/colors.dart';
import 'package:freelance_job_portal/core/utils/functions/validinput.dart';
import 'package:freelance_job_portal/core/utils/size_config.dart';
import 'package:freelance_job_portal/features/auth/presentation/views/widget/custom_button_auth.dart';
import 'package:freelance_job_portal/core/widget/custom_title.dart';
import 'package:freelance_job_portal/core/widget/space.dart';
import 'package:freelance_job_portal/features/auth/presentation/views/widget/custom_text_form.dart';
import 'package:freelance_job_portal/features/auth/presentation/views/widget/custom_text_signup.dart';
import 'package:go_router/go_router.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Form(
        child: ListView(
      children: [
        const VirticalSpace(5),
        const Center(
            child: CustomTitle(size: 25, text: "Sign In", color: primaryColer)),
        const VirticalSpace(3),
        Image.asset(
          "assets/images/logo1.png",
          height: 150,
          width: 150,
        ),
        const VirticalSpace(4),
        const Text("Welcom Back",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
            textAlign: TextAlign.center),
        const VirticalSpace(2),
        const Text("Sign In With Phone Number and Password",
            style: TextStyle(fontSize: 15), textAlign: TextAlign.center),
        const VirticalSpace(6),
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
          hinttext: "Enter Your Password",
          lable: "Password",
          icon: Icons.lock_outline,
          isNumber: false,
          valid: (password) {
            return validInput(password!, 5, 30, "password");
          },
        ),
        Container(
          margin: const EdgeInsets.only(right: 25),
          child: InkWell(
            onTap: () {
              GoRouter.of(context).push("/forgetpassword");
            },
            child: const Text("Forget Password",
                style: TextStyle(fontSize: 15, color: Colors.redAccent),
                textAlign: TextAlign.end),
          ),
        ),
        const VirticalSpace(8),
        CustomButton(
            onPressed: () {
              GoRouter.of(context).push("/home");
            },
            color: Colors.cyan,
            textcolor: Colors.white,
            text: "Sign In",
            borderSide: const BorderSide(width: 0),
            width: 20),
        const VirticalSpace(1),
        TextSignUp(
          text1: "Don’t have an account?  ",
          text2: "Sign Up",
          onTap: () {
            GoRouter.of(context).push("/signup");
          },
        )
      ],
    ));
  }
}
