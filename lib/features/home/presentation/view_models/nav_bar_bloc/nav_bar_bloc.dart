// lib/bloc/navigation/navigation_bloc.dart
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freelance_job_portal/features/chat/presentation/views/chat.dart';
import 'package:freelance_job_portal/features/home/presentation/view_models/nav_bar_bloc/nav_bar_event.dart';
import 'package:freelance_job_portal/features/home/presentation/view_models/nav_bar_bloc/nav_bar_state.dart';
import 'package:freelance_job_portal/features/home/presentation/views/home.dart';
import 'package:freelance_job_portal/features/my_project/presentation/views/my_project.dart';
import 'package:freelance_job_portal/features/profile/presentation/views/profile.dart';
import 'package:freelance_job_portal/features/wallet/presentation/views/wallet.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  final List<Widget> pages = [
    const Home(),
    const Chat(),
    const Wallet(),
    const MyProject(),
    const Profile(),
  ];

  NavigationBloc() : super(const PageLoaded(0, Home())) {
    on<PageTapped>((event, emit) {
      final currentPage = pages[event.index];
      emit(PageLoaded(event.index, currentPage));
    });
  }
}
