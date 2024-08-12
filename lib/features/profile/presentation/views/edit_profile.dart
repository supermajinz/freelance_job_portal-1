import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelance_job_portal/core/utils/dependency_injection.dart';
import 'package:freelance_job_portal/core/widget/custom_icon_back.dart';
import 'package:freelance_job_portal/core/widget/custom_title.dart';
import 'package:freelance_job_portal/features/profile/data/models/profile/client_profile.dart';
import 'package:freelance_job_portal/features/profile/presentation/view_models/bloc/profile_bloc.dart';
import 'package:freelance_job_portal/features/profile/presentation/views/widget/edit_profile_body.dart';
import 'package:go_router/go_router.dart';

class EditProfile extends StatelessWidget {
  final ClientProfile profile;
  const EditProfile({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ProfileBloc(DependencyInjection.provideProfileRepo()),
      child: Builder(
        builder: (context) => Scaffold(
          appBar: AppBar(
            actions: [
              BlocListener<ProfileBloc, ProfileState>(
                listener: (context, state) {
                  if (state is DeleteClientProfileError) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Error: ${state.errorMessage}')),
                    );
                  }
                  if (state is ClientProfileDeleted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Profile Deleted')),
                    );
                    GoRouter.of(context).push('/homescreen');
                  }
                },
                child: IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext dialogContext) {
                        return AlertDialog(
                          title: const Text('تأكيد الحذف'),
                          content:
                              const Text('هل أنت متأكد أنك تريد حذف بروفايلك؟'),
                          actions: <Widget>[
                            TextButton(
                              child: const Text(
                                'الإلغاء',
                              ),
                              onPressed: () {
                                Navigator.of(dialogContext)
                                    .pop(); // Dismiss the dialog
                              },
                            ),
                            TextButton(
                              child: const Text(
                                'الحذف',
                                style: TextStyle(color: Colors.red),
                              ),
                              onPressed: () {
                                Navigator.of(dialogContext)
                                    .pop(); // Dismiss the dialog
                                context
                                    .read<ProfileBloc>()
                                    .add(DeleteClientProfileEvent(profile.id!));
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                ),
              )
            ],
            title: const CustomTitle(
              text: 'Edit Profile',
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
              child: EditProfileBody(
            profile: profile,
          )),
        ),
      ),
    );
  }
}
