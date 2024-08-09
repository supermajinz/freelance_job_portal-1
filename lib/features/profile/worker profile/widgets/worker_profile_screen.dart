// WorkerProfile Screen
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelance_job_portal/core/utils/dependency_injection.dart';
import 'package:freelance_job_portal/core/utils/size_config.dart';
import 'package:freelance_job_portal/core/widget/custom_button_general.dart';
import 'package:freelance_job_portal/core/widget/space.dart';
import 'package:freelance_job_portal/features/auth/presentation/view_models/bloc/auth_bloc.dart';
import 'package:freelance_job_portal/features/profile/worker%20profile/bloc/worker_profile_bloc.dart';
import 'package:freelance_job_portal/features/profile/worker%20profile/widgets/worker_profile_body.dart';
import 'package:go_router/go_router.dart';

class WorkerProfileScreen extends StatelessWidget {
  const WorkerProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, authState) {
        print(authState);
        if (authState is AuthGuest) {
          return _buildGuestView(context);
        } else if (authState is AuthAuthenticated) {
          return BlocProvider(
            create: (context) =>
                WorkerProfileBloc(DependencyInjection.provideWorkerProfileRepo())
                  ..add(GetWorkerProfiles(authState.id)),
            child: BlocBuilder<WorkerProfileBloc, WorkerProfileState>(
              builder: (context, profileState) {
                if (profileState is WorkerProfileLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (profileState is WorkerProfileNoProfiles) {
                  return _buildNoProfilesView(context);
                } else if (profileState is WorkerProfilesLoaded) {
                  return Scaffold(
                    body: WorkerProfileBody(
                        workerProfiles: profileState.profiles),
                  );
                } else if (profileState is WorkerProfileGetError) {
                  return Center(
                      child: Text('Error: ${profileState.errorMessage}'));
                } else {
                  return const Center(child: Text('Unexpected State'));
                }
              },
            ),
          );
        } else {
          return const Center(child: Text('Unexpected Auth State'));
        }
      },
    );
  }

  Widget _buildGuestView(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Center(
          child: Text('عليك أن تنشأ حساب لكي تنشأ ملف شخصي'),
        ),
        VirticalSpace(1),
        CustomButtonGeneral(
          onPressed: () {
            GoRouter.of(context).push("/signup");
          },
          width: SizeConfig.defaultSize! * 25.5,
          borderSide: const BorderSide(width: 0),
          color: Theme.of(context).primaryColor,
          text: "انشاء حساب",
          textcolor: Colors.white,
        )
      ],
    );
  }

  Widget _buildNoProfilesView(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Center(
          child: Text(' ليس لديك ملف شخصي '),
        ),
        VirticalSpace(1),
        CustomButtonGeneral(
          onPressed: () {
            GoRouter.of(context).push("/createWorkerProfile");
          },
          width: SizeConfig.defaultSize! * 25.5,
          borderSide: const BorderSide(width: 0),
          color: Theme.of(context).primaryColor,
          text: "انشاء ملف شخصي",
          textcolor: Colors.white,
        )
      ],
    );
  }
}
