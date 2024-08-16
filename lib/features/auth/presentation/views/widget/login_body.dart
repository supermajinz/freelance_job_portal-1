import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelance_job_portal/core/utils/functions/validinput.dart';
import 'package:freelance_job_portal/core/utils/size_config.dart';
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
              text: "مرحبًا مجددًا، دعنا نبدأ!",
            )),
            const VirticalSpace(3),
            Image.asset(
              "assets/images/signin.png",
              height: SizeConfig.defaultSize! * 15,
              width: SizeConfig.defaultSize! * 15,
            ),
            const VirticalSpace(4),
            const Center(child: CustomTitle(text: "يسعدنا رؤيتك هنا!")),
            const VirticalSpace(2),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: SizeConfig.defaultSize! * 1),
              child: Text(
                style: Theme.of(context).textTheme.bodyLarge!,
                textAlign: TextAlign.center,
                "أكمل رحلتك في عالم العمل الحر. سجّل دخولك لاستكشاف المشاريع الجديدة وفرص النجاح.",
              ),
            ),
            const VirticalSpace(6),
            CustomTextForm(
              mycontroller: _phoneController,
              hinttext: "ادخل رقم هاتفك",
              lable: "رقم الهاتف",
              icon: Icons.phone_android_outlined,
              isNumber: true,
              valid: (p0) {
                return validInput(p0!, 5, 15, "phonenumber");
              },
            ),
            CustomTextForm(
              mycontroller: _passwordController,
              obs: true,
              hinttext: "ادخل كلمة المرور",
              lable: "كلمة المرور",
              icon: Icons.lock_outline,
              isNumber: false,
              valid: (password) {
                return validInput(password!, 5, 30, "password");
              },
            ),
            const VirticalSpace(6),
            CustomButton(
                onPressed: () {
                  context.read<AuthBloc>().add(
                        LoginEvent(
                            phone: _phoneController.text,
                            password: _passwordController.text),
                      );
                },
                color: Theme.of(context).colorScheme.secondary,
                textcolor: Colors.white,
                text: "تسجيل الدخول",
                borderSide: const BorderSide(width: 0),
                width: SizeConfig.defaultSize! * 2),
            const VirticalSpace(1),
            TextSignUp(
              text1: " هل أنت جديد هنا؟",
              text2: " أنشئ حسابًا وابدأ رحلتك اليوم ",
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
