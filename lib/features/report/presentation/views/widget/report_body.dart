import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelance_job_portal/core/utils/size_config.dart';
import 'package:freelance_job_portal/core/widget/custom_button_general.dart';
import 'package:freelance_job_portal/core/widget/custom_text_form_general.dart';
import 'package:freelance_job_portal/core/widget/space.dart';
import 'package:freelance_job_portal/features/report/presentation/view_models/bloc/report_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconly/iconly.dart';

import '../../../../auth/presentation/view_models/bloc/auth_bloc.dart';

class ReportBody extends StatefulWidget {
  const ReportBody({super.key, this.id});
  final int? id;

  @override
  State<ReportBody> createState() => _ReportBodyState();
}

class _ReportBodyState extends State<ReportBody> {
  final messageController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final userId = (context.read<AuthBloc>().state as AuthAuthenticated).id;
    return Form(
      key: formKey,
      child: ListView(
        children: [
          const VirticalSpace(4),
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: SizeConfig.defaultSize! * 1.5,
            ),
            child: CustomTextFormGeneral(
                mycontroller: messageController,
                hinttext: "",
                lable: "رسالة الشكوى",
                isNumber: false),
          ),
          const VirticalSpace(5),
          Icon(
            IconlyBroken.paper_negative,
            size: SizeConfig.defaultSize! * 25,
            color: Theme.of(context).colorScheme.error,
          ),
          const VirticalSpace(25),
          Center(
              child: BlocListener<ReportBloc, ReportState>(
            listener: (context, state) {
              if (state is ReportSuccess) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('تم ارسال الشكوى بنجاح')),
                );
                GoRouter.of(context).pop();
              }
            },
            child: CustomButtonGeneral(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    final reportData = {
                      "massage": messageController.text,
                      "senderId": userId,
                      "recipientId": widget.id
                    };

                    BlocProvider.of<ReportBloc>(context)
                        .add(AddReport(reportData));
                  }
                },
                color: Theme.of(context).primaryColor,
                textcolor: Colors.white,
                text: "إرسال",
                borderSide: const BorderSide(width: 0),
                width: SizeConfig.defaultSize! * 20),
          ))
        ],
      ),
    );
  }
}
