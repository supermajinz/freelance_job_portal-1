import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelance_job_portal/core/widget/custom_icon_back.dart';
import 'package:freelance_job_portal/core/widget/custom_title.dart';
import 'package:freelance_job_portal/features/projects/presentation/views/widget/create_project_body.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/dependency_injection.dart';
import '../../../../core/utils/size_config.dart';
import '../../../../core/widget/custom_button_general.dart';
import '../../../../core/widget/space.dart';
import '../../../auth/presentation/view_models/bloc/auth_bloc.dart';
import '../../../profile/presentation/view_models/bloc/profile_bloc.dart';

class CreateProject extends StatelessWidget {
  const CreateProject({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const CustomTitle(
              text: 'انشاء مشروع',
              white: true,
            ),
            centerTitle: true,
            backgroundColor: Theme.of(context).primaryColor,
            leading: CustomIconBack(
              onPressed: () {
                GoRouter.of(context).pop();
              },
            )),
        body: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, authState) {
            print(authState);
            if (authState is AuthGuest) {
              return _buildGuestView(context);
            } else if (authState is AuthAuthenticated) {
              return BlocProvider(
                create: (context) =>
                    ProfileBloc(DependencyInjection.provideProfileRepo())
                      ..add(GetProfiles(authState.id)),
                child: BlocBuilder<ProfileBloc, ProfileState>(
                  builder: (context, profileState) {
                    if (profileState is ProfileLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (profileState is ProfileNoProfiles) {
                      return _buildNoProfilesView(context);
                    } else if (profileState is ProfilesLoaded) {
                      return Scaffold(
                        body: CreateProjectBody(
                          clientProfiles: profileState.profiles,
                          profile: profileState.profiles[0],
                        ),
                      );
                    } else if (profileState is ProfileGetError) {
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
        const VirticalSpace(1),
        CustomButtonGeneral(
          onPressed: () {
            GoRouter.of(context).push("/createProfile");
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
