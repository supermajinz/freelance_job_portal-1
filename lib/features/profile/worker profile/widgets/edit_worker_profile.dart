// Edit Worker Profile Screen
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelance_job_portal/core/utils/dependency_injection.dart';
import 'package:freelance_job_portal/core/widget/custom_icon_back.dart';
import 'package:freelance_job_portal/core/widget/custom_title.dart';
import 'package:freelance_job_portal/features/profile/data/models/profile/worker_Profile/worker_profile.dart';
import 'package:freelance_job_portal/features/profile/worker%20profile/bloc/worker_profile_bloc.dart';
import 'package:freelance_job_portal/features/profile/worker%20profile/widgets/edit_worker_profile_body.dart';
import 'package:go_router/go_router.dart';

class EditWorkerProfile extends StatelessWidget {
  final WorkerProfile profile;
  const EditWorkerProfile({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WorkerProfileBloc(
          DependencyInjection.provideWorkerProfileRepo(),
          DependencyInjection.provideSharedPreferences()),
      child: Builder(
        builder: (context) => Scaffold(
          appBar: AppBar(
            actions: [
              BlocListener<WorkerProfileBloc, WorkerProfileState>(
                listener: (context, state) {
                  if (state is WorkerProfileDeleteError) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Error: ${state.errorMessage}')),
                    );
                  }
                  if (state is WorkerProfileDeleted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Profile Deleted')),
                    );
                    GoRouter.of(context).pushReplacement('/homescreen');
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
                              child: const Text('الإلغاء'),
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
                                    .read<WorkerProfileBloc>()
                                    .add(DeleteWorkerProfileEvent(profile.id!));
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
              child: EditWorkerProfileBody(
            profile: profile,
          )),
        ),
      ),
    );
  }
}
