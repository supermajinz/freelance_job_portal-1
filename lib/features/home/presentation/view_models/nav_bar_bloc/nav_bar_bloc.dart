// lib/bloc/navigation/navigation_bloc.dart
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freelance_job_portal/features/chat/presentation/views/chat.dart';
import 'package:freelance_job_portal/features/home/presentation/view_models/nav_bar_bloc/nav_bar_event.dart';
import 'package:freelance_job_portal/features/home/presentation/view_models/nav_bar_bloc/nav_bar_state.dart';
import 'package:freelance_job_portal/features/home/presentation/views/home.dart';
import 'package:freelance_job_portal/features/my_project/presentation/views/my_project.dart';
import 'package:freelance_job_portal/features/profile/presentation/views/profile.dart';
import 'package:freelance_job_portal/features/profile/presentation/views/widget/profile_switcher.dart';
import 'package:freelance_job_portal/features/profile/worker%20profile/widgets/worker_profile_screen.dart';
import 'package:freelance_job_portal/features/searsh/presentation/views/searsh.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  Widget getPage(int index, dynamic args) {
    switch (index) {
      case 0:
        return const Home();
      case 1:
        return const Chat();
      case 2:
        return Searsh(filters: args as Map<String, dynamic>? ?? {});
      case 3:
        return const MyProject();
      default:
      //return const Profile();
        return const ProfileSwitcher();
    }
  }

  NavigationBloc() : super(const PageLoaded(0, Home())) {
    on<PageTapped>((event, emit) {
      final currentPage = getPage(event.index, event.args);
      emit(PageLoaded(event.index, currentPage));
    });
  }
}
