import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelance_job_portal/core/utils/size_config.dart';
import 'package:freelance_job_portal/features/auth/presentation/view_models/bloc/auth_bloc.dart';
import 'package:freelance_job_portal/features/auth/presentation/views/widget/custom_auth_title.dart';
import 'package:freelance_job_portal/features/auth/presentation/views/widget/custom_button_auth.dart';
import 'package:freelance_job_portal/core/widget/space.dart';
import 'package:freelance_job_portal/features/auth/presentation/views/widget/otp_text_field.dart';
import 'package:go_router/go_router.dart';

class VerificationCodeBody extends StatefulWidget {
  const VerificationCodeBody({super.key});

  @override
  State<VerificationCodeBody> createState() => _VerificationCodeBodyState();
}

class _VerificationCodeBodyState extends State<VerificationCodeBody> {
  final otpController = TextEditingController();
  @override
  void dispose() {
    otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthAuthenticated) {
          GoRouter.of(context).pushReplacement("/homescreen");
        } else if (state is AuthError) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.error)));
        }
      },
      builder: (context, state) {
        if (State is AuthLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is AuthInvalidCode) {
          otpController.clear();
        }
        return ListView(
          children: [
            const VirticalSpace(5),
            const Center(child: CustomAuthTitle(text: "التحقق من الرمز")),
            const VirticalSpace(4),
            Container(
              margin:
                  EdgeInsets.symmetric(horizontal: SizeConfig.defaultSize! * 1),
              child: Text(
                  "لقد أرسلنا رمز تحقق إلى رقم هاتفك. من فضلك أدخل الرمز المكون من 6 أرقام أدناه لإكمال عملية التحقق وتفعيل حسابك.",
                  style: Theme.of(context).textTheme.bodyLarge,
                  textAlign: TextAlign.center),
            ),
            const VirticalSpace(6),
            OtpTextFieldVer(
              controller: otpController,
              onComplete: (verificationCode) {
                context
                    .read<AuthBloc>()
                    .add(VerifyEvent(code: verificationCode));
              },
            ),
            if (state is AuthInvalidCode)
              const Center(
                  child: Text(
                " الرمز الذي أدخلته غير صحيح. حاول مرة أخرى.",
                style: TextStyle(color: Colors.red),
              )),
            const VirticalSpace(1),
            const VirticalSpace(35),
            CustomButton(
                onPressed: () {
                  GoRouter.of(context).push("/resetpassword");
                },
                color: Theme.of(context).primaryColor,
                textcolor: Colors.white,
                text: "تحقق",
                borderSide: const BorderSide(width: 0),
                width: SizeConfig.defaultSize! * 2)
          ],
        );
      },
    );
  }
}
