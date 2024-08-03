import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelance_job_portal/features/auth/presentation/view_models/bloc/auth_bloc.dart';
import 'package:freelance_job_portal/features/home/presentation/views/home.dart';
import 'package:go_router/go_router.dart';

class DrawarView extends StatelessWidget {
  const DrawarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthUnauthenticated) {
            GoRouter.of(context).push("/");
          }
          
        },
        child: const Scaffold(
          body: Home(),
        ),
      ),
    );
  }
}
