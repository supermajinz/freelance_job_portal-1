import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelance_job_portal/core/utils/dependency_injection.dart';
import 'package:freelance_job_portal/core/utils/size_config.dart';
import 'package:freelance_job_portal/core/widget/custom_button_general.dart';
import 'package:freelance_job_portal/core/widget/space.dart';
import 'package:freelance_job_portal/features/auth/presentation/view_models/bloc/auth_bloc.dart';
import 'package:freelance_job_portal/features/profile/presentation/view_models/bloc/profile_bloc.dart';
import 'package:freelance_job_portal/features/profile/presentation/views/widget/profile_body.dart';
import 'package:go_router/go_router.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

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
                    body: ProfileBody(clientProfiles: profileState.profiles),
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
