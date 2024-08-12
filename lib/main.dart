import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelance_job_portal/core/constants/theme.dart';
import 'package:freelance_job_portal/core/localization/bloc/localization_bloc.dart';
import 'package:freelance_job_portal/core/utils/app_router.dart';
import 'package:freelance_job_portal/core/utils/dependency_injection.dart';
import 'package:freelance_job_portal/features/auth/presentation/view_models/bloc/auth_bloc.dart';
import 'package:freelance_job_portal/features/home/presentation/view_models/home_bloc/home_bloc.dart';
import 'package:freelance_job_portal/features/home/presentation/view_models/nav_bar_bloc/nav_bar_bloc.dart';
import 'package:freelance_job_portal/features/my_project/presentation/view_models/bloc/my_project_bloc.dart';
import 'package:freelance_job_portal/features/offers/presentation/view_models/bloc/offer_bloc.dart';
import 'package:freelance_job_portal/features/projects/presentation/view_models/offer_by_project/offer_by_project_bloc.dart';
import 'package:freelance_job_portal/features/projects/presentation/view_models/project_bloc/project_bloc.dart';
import 'package:freelance_job_portal/features/review/presentation/view_models/bloc/review_bloc.dart';
import 'package:freelance_job_portal/features/saved/presentation/view_models/favorites_bloc/favorites_bloc.dart';
import 'package:freelance_job_portal/features/searsh/presentation/view_models/search_bloc/search_bloc.dart';
import 'package:freelance_job_portal/l10n/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:timeago/timeago.dart' as timeago_ar;

//TODO: لوغو التطبيق يظهر عتد
void main() async {
  timeago.setLocaleMessages('ar', timeago_ar.ArMessages());
  WidgetsFlutterBinding.ensureInitialized();
  // final sharedPreferences = await SharedPreferences.getInstance;

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => LocalizationBloc()..add(LoadSavedLocalization()),
      ),
      BlocProvider(
        create: (context) => NavigationBloc(),
      ),
      BlocProvider(
        create: (context) => AuthBloc(
          DependencyInjection.provideAuthRepo(),
        )..add(CheckAuthStatusEvent()),
      ),
      BlocProvider<ProjectBloc>(
          create: (context) =>
              ProjectBloc(DependencyInjection.provideProjectRepo())),
      BlocProvider(
          create: (context) => HomeBloc(DependencyInjection.provideHomeRepo())
            ..add(FetchCategories())),
      BlocProvider(
        create: (context) => OfferBloc(DependencyInjection.provideOfferRepo()),
      ),
      BlocProvider(
        create: (context) =>
            OfferByProjectBloc(DependencyInjection.provideProjectRepo()),
      ),
      BlocProvider(
          create: (context) =>
              MyProjectBloc(DependencyInjection.provideMyProjectRepo())),
      BlocProvider(
          create: (context) =>
              SearchBloc(DependencyInjection.provideSearchRepo())),
      BlocProvider(
          create: (context) =>
              ReviewBloc(DependencyInjection.provideReviewRepo())),
      BlocProvider(
          create: (context) =>
              FavoritesBloc(DependencyInjection.provideFavoriteRepo())),
    ],
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
