import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelance_job_portal/core/localization/bloc/localization_bloc.dart';
import 'package:freelance_job_portal/core/utils/size_config.dart';
import 'package:freelance_job_portal/features/auth/presentation/view_models/bloc/auth_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconly/iconly.dart';

class DrawarBody extends StatelessWidget {
  const DrawarBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTileTheme(
      textColor: Colors.white,
      iconColor: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            width: SizeConfig.defaultSize! * 12.8,
            height: SizeConfig.defaultSize! * 12.8,
            margin: EdgeInsets.only(
              top: SizeConfig.defaultSize! * 2.4,
              bottom: SizeConfig.defaultSize! * 6.4,
            ),
            child: CircleAvatar(
              radius: SizeConfig.defaultSize! * 5,
              backgroundImage: const AssetImage(
                "assets/images/pro.jpg",
              ),
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
            leading: const Icon(Icons.bookmark_add),
            title: const Text('العناصر المحفوظة'),
          ),
          ListTile(
            onTap: () {
              GoRouter.of(context).push('/wallet');
            },
            leading: const Icon(IconlyBold.wallet),
            title: const Text('المحفظة'),
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(Icons.settings),
            title: const Text('الإعدادات'),
          ),
          ListTile(
            onTap: () {
              context.read<AuthBloc>().add(LogoutEvent());
            },
            leading: const Icon(Icons.logout),
            title: const Text('تسجيل الخروج'),
          ),
          PopupMenuButton<String>(
            icon: const Icon(
              Icons.language,
              color: Colors.white,
            ),
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
            ),
          ),
        ],
      ),
    );
  }
}
