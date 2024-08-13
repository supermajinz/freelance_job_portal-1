import 'package:flutter/material.dart';
import 'package:freelance_job_portal/core/widget/custom_icon_back.dart';
import 'package:freelance_job_portal/core/widget/custom_title.dart';
import 'package:freelance_job_portal/features/profile/data/models/profile/worker_Profile/worker_profile.dart';
import 'package:freelance_job_portal/features/protofolio/presentaion/views/widget/add_protofolio_body.dart';
import 'package:go_router/go_router.dart';

class AddProtofolio extends StatelessWidget {
  final int profileId;
  const AddProtofolio({super.key, required this.profileId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const CustomTitle(
            text: 'إنشاء عمل سابق',
            white: true,
          ),
          centerTitle: true,
          backgroundColor: Theme.of(context).primaryColor,
          leading: CustomIconBack(
            onPressed: () {
              GoRouter.of(context).pop();
            },
          )),
      body: SafeArea(
          child: AddProtofolioBody(
        profileId: profileId,
      )),
    );
  }
}
