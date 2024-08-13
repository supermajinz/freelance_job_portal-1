import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelance_job_portal/core/utils/dependency_injection.dart';
import 'package:freelance_job_portal/core/widget/custom_icon_back.dart';
import 'package:freelance_job_portal/core/widget/custom_title.dart';
import 'package:freelance_job_portal/features/profile/presentation/view_models/bloc/profile_bloc.dart';
import 'package:freelance_job_portal/features/protofolio/data/models/portofolio_job/portofolio_job/portofolio_job.dart';
import 'package:freelance_job_portal/features/protofolio/presentaion/view%20model/bloc/portofolio_bloc.dart';
import 'package:freelance_job_portal/features/protofolio/presentaion/views/widget/edit_protofolio_body.dart';
import 'package:go_router/go_router.dart';

class EditProtofolio extends StatelessWidget {
  final PortofolioJob job;
  const EditProtofolio({super.key, required this.job});

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
      body: SafeArea(
          child: BlocProvider(
        create: (context) => PortofolioBloc(
            portofolioRepo: DependencyInjection.providePortofolioRepo()),
        child: EditProtofolioBody(
          job: job,
        ),
      )),
    );
  }
}
