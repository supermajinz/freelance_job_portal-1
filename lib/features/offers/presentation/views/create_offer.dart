import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelance_job_portal/core/widget/custom_icon_back.dart';
import 'package:freelance_job_portal/core/widget/custom_title.dart';
import 'package:freelance_job_portal/features/offers/presentation/views/widget/create_offer_body.dart';
import 'package:freelance_job_portal/features/projects/data/model/project_model/project_model.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/dependency_injection.dart';
import '../../../../core/utils/size_config.dart';
import '../../../../core/widget/custom_button_general.dart';
import '../../../../core/widget/space.dart';
import '../../../auth/presentation/view_models/bloc/auth_bloc.dart';
import '../../../profile/worker profile/bloc/worker_profile_bloc.dart';

class CreateOffer extends StatelessWidget {
  const CreateOffer({super.key, required this.projectModel});

  final ProjectModel projectModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const CustomTitle(
            text: 'ارسال العرض',
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
        body: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, authState) {
            print(authState);
            if (authState is AuthGuest) {
              return _buildGuestView(context);
            } else if (authState is AuthAuthenticated) {
              return BlocProvider(
                create: (context) => WorkerProfileBloc(
                    DependencyInjection.provideWorkerProfileRepo(),
                    DependencyInjection.provideSharedPreferences())
                  ..add(GetWorkerProfiles(authState.id)),
                child: BlocBuilder<WorkerProfileBloc, WorkerProfileState>(
                  builder: (context, profileState) {
                    if (profileState is WorkerProfileLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (profileState is WorkerProfileNoProfiles) {
                      return _buildNoProfilesView(context);
                    } else if (profileState is WorkerProfilesLoaded) {
                      return Scaffold(
                        body: CreateOfferBody(
                            projectModel: projectModel,
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
        ));
  }

  Widget _buildGuestView(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Center(
          child: Text('عليك أن تنشأ حساب لكي تنشأ ملف شخصي'),
        ),
        const VirticalSpace(1),
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
        const VirticalSpace(1),
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
