import 'package:flutter/material.dart';
import 'package:freelance_job_portal/core/utils/size_config.dart';
import 'package:freelance_job_portal/features/report/presentation/views/widget/report_body.dart';

class Report extends StatelessWidget {
  const Report({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        appBar: AppBar(
        title: const Text('Report'),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {},
            icon: Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(5),
                    border: Border.all(width: 1)
                    ),
                child: const Icon(Icons.arrow_back,size: 25))),
      ),
      body:const ReportBody(),
    );
  }
}