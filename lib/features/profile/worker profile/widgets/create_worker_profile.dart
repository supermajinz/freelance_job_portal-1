// Create Worker Profile Screen
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelance_job_portal/core/utils/dependency_injection.dart';
import 'package:freelance_job_portal/core/widget/custom_icon_back.dart';
import 'package:freelance_job_portal/core/widget/custom_title.dart';
import 'package:freelance_job_portal/features/profile/worker%20profile/bloc/worker_profile_bloc.dart';
import 'package:freelance_job_portal/features/profile/worker%20profile/widgets/create_worker_profile_body.dart';
import 'package:go_router/go_router.dart';

class CreateWorkerProfile extends StatelessWidget {
  const CreateWorkerProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomTitle(
          text: 'انشاء ملف شخصي',
          white: true,
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
        leading: CustomIconBack(
          onPressed: () {
            GoRouter.of(context).pop();
          },
        ),
      ),
      body: SafeArea(
          child: BlocProvider(
        create: (context) => WorkerProfileBloc(
            DependencyInjection.provideWorkerProfileRepo(),
            DependencyInjection.provideSharedPreferences()),
        child: const CreateWorkerProfileBody(),
      )),
    );
  }
}
