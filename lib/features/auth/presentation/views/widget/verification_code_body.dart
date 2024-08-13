import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelance_job_portal/core/utils/size_config.dart';
import 'package:freelance_job_portal/features/auth/presentation/view_models/bloc/auth_bloc.dart';
import 'package:freelance_job_portal/features/auth/presentation/views/widget/custom_auth_title.dart';
import 'package:freelance_job_portal/features/auth/presentation/views/widget/custom_button_auth.dart';
import 'package:freelance_job_portal/core/widget/custom_title.dart';
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
          GoRouter.of(context).push("/homescreen");
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
            const Center(child: CustomAuthTitle(text: "Verification Code")),
            const VirticalSpace(4),
            const Center(
              child: CustomTitle(
                text: "Check Code",
              ),
            ),
            const VirticalSpace(2),
            Container(
              margin:
                  EdgeInsets.symmetric(horizontal: SizeConfig.defaultSize! * 1),
              child: Text("please Enter The Digit Code",
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
              Center(
                  child: Text(
                state.message,
                style: const TextStyle(color: Colors.red),
              )),
            const VirticalSpace(1),
            const Text("Resend",
                style: TextStyle(
                    fontSize: 16, decoration: TextDecoration.underline),
                textAlign: TextAlign.center),
            const VirticalSpace(35),
            CustomButton(
                onPressed: () {
                  GoRouter.of(context).push("/resetpassword");
                },
                color: Theme.of(context).primaryColor,
                textcolor: Colors.white,
                text: "Check",
                borderSide: const BorderSide(width: 0),
                width: SizeConfig.defaultSize! * 2)
          ],
        );
      },
    );
  }
}
