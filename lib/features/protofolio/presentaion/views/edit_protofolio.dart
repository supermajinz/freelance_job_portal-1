import 'package:flutter/material.dart';
import 'package:freelance_job_portal/core/widget/custom_icon_back.dart';
import 'package:freelance_job_portal/core/widget/custom_title.dart';
import 'package:freelance_job_portal/features/protofolio/presentaion/views/widget/edit_protofolio_body.dart';
import 'package:go_router/go_router.dart';

class EditProtofolio extends StatelessWidget {
  const EditProtofolio({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const CustomTitle(
            text: 'Edit Protofolio',
            white: true,
          ),
          centerTitle: true,
          backgroundColor: Theme.of(context).primaryColor,
          leading: CustomIconBack(
            onPressed: () {
              GoRouter.of(context).pop();
            },
          )),
      body: const SafeArea(child: EditProtofolioBody()),
    );
  }
}
