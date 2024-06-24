import 'package:flutter/material.dart';
import 'package:freelance_job_portal/core/constants/colors.dart';
import 'package:freelance_job_portal/core/utils/functions/validinput.dart';
import 'package:freelance_job_portal/core/widget/custom_button.dart';
import 'package:freelance_job_portal/core/widget/custom_title.dart';
import 'package:freelance_job_portal/core/widget/space.dart';
import 'package:freelance_job_portal/features/auth/presentation/views/widget/custom_text_form.dart';
import 'package:go_router/go_router.dart';

class ForgetPasswordBody extends StatelessWidget {
  const ForgetPasswordBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
        child: ListView(
      children: [
        const VirticalSpace(5),
        const Center(
            child: CustomTitle(
                size: 25, text: "Forget Password", color: primaryColer)),
        const VirticalSpace(4),
        const Text("Cheek Phone Number",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
            textAlign: TextAlign.center),
        const VirticalSpace(2),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: const Text(
              "please Enter Your Phone Number To Recive A Verification Code",
              style: TextStyle(fontSize: 15),
              textAlign: TextAlign.center),
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
        const VirticalSpace(38),
        CustomButton(
            onPressed: () {
              GoRouter.of(context).push("/verificationcode");
            },
            color: const Color.fromARGB(255, 80, 34, 88),
            textcolor: Colors.white,
            text: "Ckeek",
            borderSide: const BorderSide(width: 0),
            width: 20),
      ],
    ));
  }
}
