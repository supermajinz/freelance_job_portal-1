import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:freelance_job_portal/core/localization/bloc/localization_bloc.dart';
import 'package:freelance_job_portal/core/utils/size_config.dart';
import 'package:freelance_job_portal/core/widget/custom_title.dart';
import 'package:freelance_job_portal/features/auth/presentation/view_models/bloc/auth_bloc.dart';
import 'package:freelance_job_portal/features/home/presentation/views/widget/home_body.dart';
import 'package:go_router/go_router.dart';

class DrawarView extends StatefulWidget {
  const DrawarView({super.key});

  @override
  _DrawarViewState createState() => _DrawarViewState();
}

class _DrawarViewState extends State<DrawarView> {
  final _advancedDrawerController = AdvancedDrawerController();

  @override
  Widget build(BuildContext context) {
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
        borderRadius:
            BorderRadius.all(Radius.circular(SizeConfig.defaultSize! * 1.6)),
      ),
      drawer: SafeArea(
        child: ListTileTheme(
          textColor: Colors.white,
          iconColor: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: 128.0,
                height: 128.0,
                margin: EdgeInsets.only(
                  top: SizeConfig.defaultSize! * 2.4,
                  bottom: SizeConfig.defaultSize! * 6.4,
                ),
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(
                  color: Colors.black26,
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  'assets/images/pro.jpg',
                ),
              ),
              ListTile(
                onTap: () {},
                leading: const Icon(Icons.home),
                title: const Text('الرئيسية'),
              ),
              ListTile(
                onTap: () {},
                leading: const Icon(Icons.account_circle_rounded),
                title: const Text('الملف الشخصي'),
              ),
              ListTile(
                onTap: () {
                  GoRouter.of(context).push('/saved');
                },
                leading: const Icon(Icons.bookmark_add_outlined),
                title: const Text('العناصر المحفوظة'),
              ),
              ListTile(
                onTap: () {},
                leading: const Icon(Icons.settings),
                title: const Text('الإعدادات'),
              ),
              PopupMenuButton<String>(
                icon: const Icon(Icons.language),
                itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                  PopupMenuItem<String>(
                    value: 'en',
                    child: const Text('English'),
                    onTap: () {
                      BlocProvider.of<LocalizationBloc>(context)
                          .add(const LoadLocalization(Locale('en')));
                    },
                  ),
                  PopupMenuItem<String>(
                    value: 'ar',
                    child: const Text('Arabic'),
                    onTap: () {
                      BlocProvider.of<LocalizationBloc>(context)
                          .add(const LoadLocalization(Locale('ar')));
                    },
                  ),
                ],
              ),
              const Spacer(),
              DefaultTextStyle(
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.white54,
                ),
                child: Container(
                  margin: EdgeInsets.symmetric(
                    vertical: SizeConfig.defaultSize! * 1.6,
                  ),
                  child: const Text(''),
                ),
              ),
            ],
          ),
        ),
      ),
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
          title: const CustomTitle(text: "الرئيسية",white: true,),
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
        body:  BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if(state is AuthLoggedOut){
          GoRouter.of(context).push("/");
        }
      },
      child: Scaffold(
        body:  const HomeBody(),
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  context.read<AuthBloc>().add(LogoutEvent());
                },
                icon: const Icon(Icons.logout)),
          ],
        ),
      ),
    )
      ),
    );
  }

  void _handleMenuButtonPressed() {
    _advancedDrawerController.showDrawer();
  }
}
