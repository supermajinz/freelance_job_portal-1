import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelance_job_portal/core/utils/functions/show_buttom_sheet_auth.dart';
import 'package:freelance_job_portal/core/utils/size_config.dart';
import 'package:freelance_job_portal/features/auth/presentation/view_models/bloc/auth_bloc.dart';
import 'package:freelance_job_portal/features/auth/presentation/views/widget/custom_auth_title.dart';
import 'package:freelance_job_portal/features/auth/presentation/views/widget/custom_button_auth.dart';
import 'package:freelance_job_portal/core/widget/custom_title.dart';
import 'package:freelance_job_portal/core/widget/space.dart';
import 'package:freelance_job_portal/features/auth/presentation/views/widget/otp_text_field.dart';
import 'package:go_router/go_router.dart';

class VerificationSignupBody extends StatefulWidget {
  const VerificationSignupBody({super.key});

  @override
  State<VerificationSignupBody> createState() => _VerificationSignupBodyState();
}

class _VerificationSignupBodyState extends State<VerificationSignupBody> {
  bool isCodeInvalid = false;
  String errorMessage = '';
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
        } else if (state is AuthInvalidCode) {
          setState(() {
            isCodeInvalid = true;
            errorMessage = state.message;
            otpController.clear();
          });
        } else {
          setState(() {
            isCodeInvalid = false;
            errorMessage = '';
          });
        }
      },
      builder: (context, state) {
        if (state is AuthLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        return ListView(
          children: [
            const VirticalSpace(5),
            const Center(child: CustomAuthTitle(text: "Check Phone Number")),
            const VirticalSpace(4),
             Center(child: CustomTitle(text: "Complete Sign Up")),
            const VirticalSpace(2),
            Container(
              margin: EdgeInsets.symmetric(
                  horizontal: SizeConfig.defaultSize! * 1.5),
              child: const Text(
                  "We have sent a code to your phone number,Please enter it below to complete signing up",
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.center),
            ),
            const VirticalSpace(6),
            OtpTextFieldVer(
              controller: otpController,
              isError: isCodeInvalid,
              onComplete: (verificationCode) {
                context
                    .read<AuthBloc>()
                    .add(VerifyEvent(code: verificationCode));
              },
            ),
            if (isCodeInvalid)
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  errorMessage,
                  style: const TextStyle(color: Colors.red),
                  textAlign: TextAlign.center,
                ),
              ),
            const VirticalSpace(1),
            InkWell(
              onTap: () {},
              child: const Text(
                "Resend",
                style: TextStyle(
                    fontSize: 16, decoration: TextDecoration.underline),
                textAlign: TextAlign.center,
              ),
            ),
            const VirticalSpace(29),
            CustomButton(
                onPressed: () {
                  showButtomSheet(context, "Account successfully created");
                },
                color: const Color.fromARGB(255, 80, 34, 88),
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
