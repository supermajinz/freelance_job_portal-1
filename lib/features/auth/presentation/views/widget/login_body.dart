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
            child: CustomAuthTitle(
          text: "Sign In",
        )),
        const VirticalSpace(3),
        Image.asset(
          "assets/images/logo1.png",
          height: SizeConfig.defaultSize! * 15,
          width: SizeConfig.defaultSize! * 15,
        ),
        const VirticalSpace(4),
       const Center(child: CustomTitle(text: "Welcom Back")),
        const VirticalSpace(2),
        const Center(
          child: CustomBodyMedium(text: "Sign In With Phone Number and Password",
             ),
        ),
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
                style: TextStyle(fontSize: 15, color: Color.fromARGB(255, 165, 11, 11)),
                textAlign: TextAlign.end),
          ),
        ),
        const VirticalSpace(8),
        CustomButton(
            onPressed: () {
              GoRouter.of(context).push("/home");
            },
            color: Colors.cyanAccent,
            textcolor: Colors.white,
            text: "Sign In",
            borderSide: const BorderSide(width: 0),
            width: SizeConfig.defaultSize! *2),
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
