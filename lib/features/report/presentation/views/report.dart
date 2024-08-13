import 'package:flutter/material.dart';
import 'package:freelance_job_portal/core/utils/size_config.dart';
import 'package:freelance_job_portal/core/widget/custom_icon_back.dart';
import 'package:freelance_job_portal/core/widget/custom_title.dart';
import 'package:freelance_job_portal/features/report/presentation/views/widget/report_body.dart';
import 'package:go_router/go_router.dart';

class Report extends StatelessWidget {
  const Report({super.key, this.id});
  final int? id;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
          title: const CustomTitle(
            text: 'ابلاغ',
            white: true,
          ),
          centerTitle: true,
          backgroundColor: Theme.of(context).primaryColor,
          leading: CustomIconBack(
            onPressed: () {
              GoRouter.of(context).pop();
            },
          )),
      body:  SafeArea(child: ReportBody(id: id)),
    );
  }
}
