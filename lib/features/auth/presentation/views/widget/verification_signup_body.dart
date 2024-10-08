import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelance_job_portal/core/utils/functions/show_buttom_sheet_auth.dart';
import 'package:freelance_job_portal/core/utils/size_config.dart';
import 'package:freelance_job_portal/features/auth/presentation/view_models/bloc/auth_bloc.dart';
import 'package:freelance_job_portal/features/auth/presentation/views/widget/custom_auth_title.dart';
import 'package:freelance_job_portal/features/auth/presentation/views/widget/custom_button_auth.dart';
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
    SizeConfig().init(context);
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthAuthenticated) {
          GoRouter.of(context).pushReplacement("/homescreen");
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
            const Center(child: CustomAuthTitle(text: "التحقق من الرمز")),
            const VirticalSpace(4),
            Container(
              margin: EdgeInsets.symmetric(
                  horizontal: SizeConfig.defaultSize! * 1.5),
              child: Text(
                  "لقد أرسلنا رمز تحقق إلى رقم هاتفك. من فضلك أدخل الرمز المكون من 6 أرقام أدناه لإكمال عملية التحقق وتفعيل حسابك.",
                  style: Theme.of(context).textTheme.bodyLarge,
                  textAlign: TextAlign.center),
            ),
            const VirticalSpace(8),
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
            const VirticalSpace(40),
            CustomButton(
                onPressed: () {
                  showButtomSheet(context, "تم انشاء الحساب بنجاح");
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
