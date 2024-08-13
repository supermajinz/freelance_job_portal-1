import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelance_job_portal/core/widget/custom_empty.dart';
import 'package:freelance_job_portal/core/widget/custom_loading.dart';
import 'package:freelance_job_portal/features/my_project/presentation/views/widget/custom_project_status.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/utils/size_config.dart';
import '../../../../auth/presentation/view_models/bloc/auth_bloc.dart';
import '../../view_models/bloc/my_project_bloc.dart';

class MyProjectBody extends StatefulWidget {
  const MyProjectBody({super.key});

  @override
  State<MyProjectBody> createState() => _MyProjectBodyState();
}

class _MyProjectBodyState extends State<MyProjectBody> {
  @override
  void initState() {
    final userId = (context.read<AuthBloc>().state as AuthAuthenticated).id;
    context.read<MyProjectBloc>().add(FetchMyProject(userId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyProjectBloc, MyProjectState>(
      builder: (context, state) {
        if (state is MyProjectLoading) {
          return const CustomLoading();
        } else if (state is MyProjectFaliure) {
          return Center(
              child: Text('Failed to load projects: ${state.message}'));
        } else if (state is MyProjectSuccess) {
          if (state.projects.isEmpty) {
            return const CustomEmpty();
          } else {
            return ListView.builder(
              itemCount: state.projects.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: SizeConfig.defaultSize! * 0.5),
                  child: InkWell(
                    onTap: () {
                      GoRouter.of(context).push("/projectstatusdetails",
                          extra: state.projects[index]);
                    },
                    child: CustomProjectStatus(
                      projectModel: state.projects[index],
                    ),
                  ),
                );
              },
            );
          }
        } else {
          return const Center(child: Text('No projects found'));
        }
      },
    );
  }
}
