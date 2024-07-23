import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:freelance_job_portal/core/constants/colors.dart';
import 'package:freelance_job_portal/features/home/presentation/view_models/nav_bar_bloc/nav_bar_bloc.dart';
import 'package:freelance_job_portal/features/home/presentation/view_models/nav_bar_bloc/nav_bar_event.dart';
import 'package:freelance_job_portal/features/home/presentation/view_models/nav_bar_bloc/nav_bar_state.dart';
import 'package:iconly/iconly.dart';
import 'package:navigation_view/item_navigation_view.dart';
import 'package:navigation_view/navigation_view.dart';
import 'package:go_router/go_router.dart';
import 'package:freelance_job_portal/core/utils/size_config.dart';
import 'package:freelance_job_portal/core/widget/custom_title.dart';
import 'package:freelance_job_portal/features/home/presentation/views/widget/drawar_body.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  _HomescreenState createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  final _advancedDrawerController = AdvancedDrawerController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NavigationBloc(),
      child: BlocBuilder<NavigationBloc, NavigationState>(
        builder: (context, state) {
          if (state is PageLoaded) {
            return AdvancedDrawer(
              backdrop: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [Colors.blueGrey, Colors.blueGrey.withOpacity(0.2)],
                  ),
                ),
              ),
              controller: _advancedDrawerController,
              animationCurve: Curves.easeInOut,
              animationDuration: const Duration(milliseconds: 300),
              animateChildDecoration: true,
              rtlOpening: true,
              disabledGestures: false,
              childDecoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                    Radius.circular(SizeConfig.defaultSize! * 1.6)),
              ),
              drawer: const SafeArea(child: DrawarBody()),
              child: Scaffold(
                appBar: AppBar(
                  elevation: 5,
                  shadowColor: Theme.of(context).primaryColor,
                  actions: [
                    IconButton(
                        onPressed: () {
                          GoRouter.of(context).push("/notifications");
                        },
                        icon: const Icon(Icons.notifications_active_outlined))
                  ],
                  backgroundColor: Theme.of(context).primaryColor,
                  title: CustomTitle(
                    text: _getAppBarTitle(state.currentIndex),
                    white: true,
                  ),
                  centerTitle: true,
                  iconTheme: const IconThemeData(color: Colors.white, size: 28),
                  leading: IconButton(
                    onPressed: _handleMenuButtonPressed,
                    icon: ValueListenableBuilder<AdvancedDrawerValue>(
                      valueListenable: _advancedDrawerController,
                      builder: (_, value, __) {
                        return AnimatedSwitcher(
                          duration: const Duration(milliseconds: 250),
                          child: Icon(
                            value.visible ? Icons.clear : Icons.menu,
                            key: ValueKey<bool>(value.visible),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                body: state.currentPage,
                floatingActionButton: FloatingActionButton(
                  onPressed: () {
                    GoRouter.of(context).push("/createproject");
                  },
                  child: const Icon(
                    Icons.add,
                    size: 25,
                  ),
                ),
                bottomNavigationBar: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
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
              ),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  void _handleMenuButtonPressed() {
    _advancedDrawerController.showDrawer();
  }

  String _getAppBarTitle(int index) {
    switch (index) {
      case 0:
        return 'الرئيسية';
      case 1:
        return 'المحادثة';
      case 2:
        return 'البحث';
      case 3:
        return 'مشاريعي';
      case 4:
        return 'الملف الشخصي';
      default:
        return 'الرئيسية';
    }
  }
}
