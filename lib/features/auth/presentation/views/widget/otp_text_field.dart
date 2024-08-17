import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:freelance_job_portal/core/utils/size_config.dart';

class OtpTextFieldVer extends StatelessWidget {
  final Function(String) onComplete;
  final bool isError;
  final TextEditingController controller;

  const OtpTextFieldVer({
    super.key,
    required this.onComplete,
    this.isError = false,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: OtpTextField(
        numberOfFields: 6,
        borderRadius: BorderRadius.circular(SizeConfig.defaultSize! * 2),
        fieldWidth: SizeConfig.defaultSize! * 5,
        borderColor: isError ? const Color(0xFF512DA8) : Colors.red,
        //set to true to show as box or false to show as dash
        showFieldAsBox: true,
        //runs when a code is typed in
        onCodeChanged: (String code) {
          //handle validation or checks here
        },
        //runs when every textfield is filled
        onSubmit: (String verificationCode) {
          onComplete(verificationCode);
        }, // end onSubmit
      ),
    );
  }
}
