import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelance_job_portal/core/utils/size_config.dart';
import 'package:freelance_job_portal/core/widget/custom_button_general.dart';
import 'package:freelance_job_portal/core/widget/custom_text_form_general.dart';
import 'package:freelance_job_portal/core/widget/space.dart';
import 'package:freelance_job_portal/features/report/presentation/view_models/bloc/report_bloc.dart';

import '../../../../auth/presentation/view_models/bloc/auth_bloc.dart';

class ReportBody extends StatelessWidget {
  const ReportBody({super.key, this.id});
  final int? id;

  @override
  Widget build(BuildContext context) {
    final userId = (context.read<AuthBloc>().state as AuthAuthenticated).id;
    final messageController = TextEditingController();
    final formKey = GlobalKey<FormState>();
    return Form(
      key: formKey,
      child: ListView(
        children: [
          const VirticalSpace(5),
          Container(
            margin: EdgeInsets.symmetric(
                horizontal: SizeConfig.defaultSize! * 1.5,
                vertical: SizeConfig.defaultSize! * 1.5),
            child: CustomTextFormGeneral(
                mycontroller: messageController,
                hinttext: "",
                lable: "رسالة الشكوى",
                isNumber: false),
          ),
          const VirticalSpace(8),
          Center(
              child: Image.asset(
            'assets/images/logo_outline.png',
            height: SizeConfig.defaultSize! * 20,
            width: SizeConfig.defaultSize! * 20,
            fit: BoxFit.fill,
          )),
          const VirticalSpace(28),
          Center(
              child: CustomButtonGeneral(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      final reportData = {
                        "massage": messageController.text,
                        "senderId": userId,
                        "recipientId": id
                      };

                      BlocProvider.of<ReportBloc>(context)
                          .add(AddReport(reportData));
                    }
                  },
                  color: Theme.of(context).primaryColor,
                  textcolor: Colors.white,
                  text: "إرسال",
                  borderSide: const BorderSide(width: 0),
                  width: SizeConfig.defaultSize! * 20))
        ],
      ),
    );
  }
}
