import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelance_job_portal/core/utils/functions/validinput.dart';
import 'package:freelance_job_portal/core/utils/size_config.dart';
import 'package:freelance_job_portal/core/widget/custom_body_medium.dart';
import 'package:freelance_job_portal/core/widget/custom_title.dart';
import 'package:freelance_job_portal/features/auth/presentation/view_models/bloc/auth_bloc.dart';
import 'package:freelance_job_portal/features/auth/presentation/views/widget/custom_auth_title.dart';
import 'package:freelance_job_portal/features/auth/presentation/views/widget/custom_button_auth.dart';
import 'package:freelance_job_portal/core/widget/space.dart';
import 'package:freelance_job_portal/features/auth/presentation/views/widget/custom_text_form.dart';
import 'package:freelance_job_portal/features/auth/presentation/views/widget/custom_text_signup.dart';
import 'package:go_router/go_router.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({super.key});

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthCodeSent) {
          GoRouter.of(context).push("/verificationcode");
        }
        if (state is AuthError) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.error)));
        }
      },
      builder: (context, state) {
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
              child: CustomBody(
                text: "Sign In With Phone Number and Password",
              ),
            ),
            const VirticalSpace(6),
            CustomTextForm(
              mycontroller: _phoneController,
              hinttext: "Enter Your Phone Number",
              lable: "Phone Number",
              icon: Icons.phone_android_outlined,
              isNumber: true,
              valid: (p0) {
                return validInput(p0!, 5, 15, "phonenumber");
              },
            ),
            CustomTextForm(
              mycontroller: _passwordController,
              obs: true,
              hinttext: "Enter Your Password",
              lable: "Password",
              icon: Icons.lock_outline,
              isNumber: false,
              valid: (password) {
                return validInput(password!, 5, 30, "password");
              },
            ),
            Container(
              margin: EdgeInsets.only(
                  right: SizeConfig.defaultSize! * 2.5,
                  left: SizeConfig.defaultSize! * 2.5),
              child: InkWell(
                onTap: () {
                  GoRouter.of(context).push("/forgetpassword");
                },
                child: const Text("Forget Password",
                    style: TextStyle(
                        fontSize: 15, color: Color.fromARGB(255, 165, 11, 11)),
                    textAlign: TextAlign.end),
              ),
            ),
            const VirticalSpace(8),
            CustomButton(
                onPressed: () {
                  context.read<AuthBloc>().add(
                        LoginEvent(
                            phone: _phoneController.text,
                            password: _passwordController.text),
                      );
                },
                color: Colors.cyanAccent,
                textcolor: Colors.white,
                text: "Sign In",
                borderSide: const BorderSide(width: 0),
                width: SizeConfig.defaultSize! * 2),
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
      },
    );
  }
}
