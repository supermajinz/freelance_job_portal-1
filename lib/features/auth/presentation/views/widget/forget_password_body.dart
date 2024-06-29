import 'package:flutter/material.dart';
import 'package:freelance_job_portal/core/utils/functions/validinput.dart';
import 'package:freelance_job_portal/core/utils/size_config.dart';
import 'package:freelance_job_portal/features/auth/presentation/views/widget/custom_auth_title.dart';
import 'package:freelance_job_portal/features/auth/presentation/views/widget/custom_button_auth.dart';
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
        const Center(child: CustomAuthTitle(text: "Forget Password")),
        const VirticalSpace(4),
        const Center(child: CustomTitle(text: "Cheek Phone Number")),
        const VirticalSpace(2),
        Container(
          margin: EdgeInsets.symmetric(horizontal: SizeConfig.defaultSize! * 1),
          child: const Text(
              "please Enter Your Phone Number To Recive A Verification Code",
              style: TextStyle(fontSize: 18),
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
        const VirticalSpace(34),
        CustomButton(
            onPressed: () {
              GoRouter.of(context).push("/verificationcode");
            },
            color: Theme.of(context).primaryColor,
            textcolor: Colors.white,
            text: "Ckeek",
            borderSide: const BorderSide(width: 0),
            width: SizeConfig.defaultSize! * 2),
      ],
    ));
  }
}
