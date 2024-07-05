// lib/widgets/bottom_navigation_bar.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelance_job_portal/core/constants/colors.dart';
import 'package:freelance_job_portal/features/home/presentation/view_models/nav_bar_bloc/nav_bar_bloc.dart';
import 'package:freelance_job_portal/features/home/presentation/view_models/nav_bar_bloc/nav_bar_event.dart';
import 'package:freelance_job_portal/features/home/presentation/view_models/nav_bar_bloc/nav_bar_state.dart';
import 'package:iconly/iconly.dart';
import 'package:navigation_view/item_navigation_view.dart';
import 'package:navigation_view/navigation_view.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NavigationBloc(),
      child: BlocBuilder<NavigationBloc, NavigationState>(
        builder: (context, state) {
          if (state is PageLoaded) {
            return Scaffold(
              body: state.currentPage,
              bottomNavigationBar: Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                color: Theme.of(context).primaryColor,
                child: NavigationView(
                  backgroundColor: Theme.of(context).primaryColor,
                  curve: Curves.fastEaseInToSlowEaseOut,
                  color: Theme.of(context).primaryColor,
                  borderTopColor: Theme.of(context).primaryColor,
                  onChangePage: (index) {
                    context.read<NavigationBloc>().add(PageTapped(index));
                  },
                  items: [
                    ItemNavigationView(
                      childAfter: const Icon(
                        IconlyBold.home,
                        color: primaryColer,
                        size: 30,
                      ),
                      childBefore: const Icon(
                        IconlyBold.home,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                    ItemNavigationView(
                      childAfter: const Icon(
                        IconlyBold.chat,
                        color: primaryColer,
                        size: 30,
                      ),
                      childBefore: const Icon(
                        IconlyBold.chat,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                    ItemNavigationView(
                      childAfter: const Icon(
                        IconlyBold.search,
                        color: primaryColer,
                        size: 30,
                      ),
                      childBefore: const Icon(
                        IconlyBold.search,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                    ItemNavigationView(
                      childAfter: const Icon(
                        IconlyBold.bag,
                        color: primaryColer,
                        size: 30,
                      ),
                      childBefore: const Icon(
                        IconlyBold.bag,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                    ItemNavigationView(
                      childAfter: const Icon(
                        IconlyBold.profile,
                        color: primaryColer,
                        size: 30,
                      ),
                      childBefore: const Icon(
                        IconlyBold.profile,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
