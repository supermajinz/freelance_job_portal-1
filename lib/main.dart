import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelance_job_portal/core/constants/theme.dart';
import 'package:freelance_job_portal/core/localization/bloc/localization_bloc.dart';
import 'package:freelance_job_portal/core/utils/app_router.dart';
import 'package:freelance_job_portal/l10n/l10n.dart';
//import 'package:get/get.dart';
//import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'l10n/l10n.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //final sharedPreferences = await SharedPreferences.getInstance;
  runApp(BlocProvider(
    create: (context) => LocalizationBloc()..add(LoadSavedLocalization()),
    child: const FreelanceJob(),
  ));
}

class FreelanceJob extends StatelessWidget {
  const FreelanceJob({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocalizationBloc, LocalizationState>(
      builder: (context, state) {
        return MaterialApp.router(
          supportedLocales: L10n.all,
          locale: state.locale,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          routerConfig: AppRouter.router,
          debugShowCheckedModeBanner: false,
          theme: getThemeForLocale(state.locale),
        );
      },
    );
  }
}
