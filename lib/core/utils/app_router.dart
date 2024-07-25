import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelance_job_portal/features/auth/presentation/view_models/bloc/auth_bloc.dart';
import 'package:freelance_job_portal/features/auth/presentation/views/login.dart';
import 'package:freelance_job_portal/features/auth/presentation/views/verification_code.dart';
import 'package:freelance_job_portal/features/auth/presentation/views/forget_password.dart';
import 'package:freelance_job_portal/features/auth/presentation/views/resetpassword.dart';
import 'package:freelance_job_portal/features/auth/presentation/views/signup.dart';
import 'package:freelance_job_portal/features/auth/presentation/views/verification_signup.dart';
import 'package:freelance_job_portal/features/chat/presentation/views/chat.dart';
import 'package:freelance_job_portal/features/chat/presentation/views/dms.dart';
import 'package:freelance_job_portal/features/home/presentation/views/home.dart';
import 'package:freelance_job_portal/features/home/presentation/views/homescreen.dart';
import 'package:freelance_job_portal/features/home/presentation/views/widget/skills.dart';
import 'package:freelance_job_portal/features/my_project/presentation/views/my_project.dart';
import 'package:freelance_job_portal/features/my_project/presentation/views/project_status_details.dart';
import 'package:freelance_job_portal/features/notifications/presentation/views/notifications.dart';
import 'package:freelance_job_portal/features/offers/presentation/views/create_offer.dart';
import 'package:freelance_job_portal/features/offers/presentation/views/edit_offer.dart';
import 'package:freelance_job_portal/features/offers/presentation/views/offer_details.dart';
import 'package:freelance_job_portal/features/onboarding/presentation/views/onboarding_view.dart';
import 'package:freelance_job_portal/features/profile/presentation/views/create_profile.dart';
import 'package:freelance_job_portal/features/profile/presentation/views/edit_profile.dart';
import 'package:freelance_job_portal/features/profile/presentation/views/profile.dart';
import 'package:freelance_job_portal/features/projects/presentation/views/create_project.dart';
import 'package:freelance_job_portal/features/projects/presentation/views/edit_project.dart';
import 'package:freelance_job_portal/features/projects/presentation/views/show_project_details.dart';
import 'package:freelance_job_portal/features/protofolio/presentaion/views/add_protofolio.dart';
import 'package:freelance_job_portal/features/protofolio/presentaion/views/edit_protofolio.dart';
import 'package:freelance_job_portal/features/protofolio/presentaion/views/show_proto_details.dart';
import 'package:freelance_job_portal/features/report/presentation/views/report.dart';
import 'package:freelance_job_portal/features/review/presentation/views/review.dart';
import 'package:freelance_job_portal/features/saved/presentation/views/saved.dart';
import 'package:freelance_job_portal/features/searsh/presentation/views/searsh.dart';
import 'package:freelance_job_portal/features/searsh/presentation/views/sort.dart';
import 'package:freelance_job_portal/features/wallet/presentation/views/deposit.dart';
import 'package:freelance_job_portal/features/wallet/presentation/views/wallet.dart';
import 'package:freelance_job_portal/features/wallet/presentation/views/withdraw.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static final router = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          if (state is AuthAuthenticated) {
            return const Homescreen();
          } else {
            return const OnboardingView();
          }
        },
      ),
    ),
    GoRoute(
      path: '/onboardingview',
      builder: (context, state) => const OnboardingView(),
    ),
    GoRoute(
      path: '/signup',
      builder: (context, state) => const Signup(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const Login(),
    ),
    GoRoute(
      path: '/forgetpassword',
      builder: (context, state) => const ForgetPassword(),
    ),
    GoRoute(
      path: '/verificationcode',
      builder: (context, state) => const VerificationCode(),
    ),
    GoRoute(
      path: '/resetpassword',
      builder: (context, state) => const Resetpassword(),
    ),
    GoRoute(
      path: '/verificationsignup',
      builder: (context, state) => const VerificationSignup(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const Home(),
    ),
    GoRoute(
      path: '/skills',
      builder: (context, state) => const Skills(),
    ),
    GoRoute(
      path: '/homescreen',
      builder: (context, state) => const Homescreen(),
    ),
    GoRoute(
      path: '/wallet',
      builder: (context, state) => const Wallet(),
    ),
    GoRoute(
      path: '/deposit',
      builder: (context, state) => const Deposit(),
    ),
    GoRoute(
      path: '/withdraw',
      builder: (context, state) => const Withdraw(),
    ),
    GoRoute(
      path: '/profile',
      builder: (context, state) => const Profile(),
    ),
    GoRoute(
      path: '/createprofile',
      builder: (context, state) => const CreateProfile(),
    ),
    GoRoute(
      path: '/editprofile',
      builder: (context, state) => const EditProfile(),
    ),
    GoRoute(
      path: '/addprotofolio',
      builder: (context, state) => const AddProtofolio(),
    ),
    GoRoute(
      path: '/editprotofolio',
      builder: (context, state) => const EditProtofolio(),
    ),
    GoRoute(
      path: '/showprotodetails',
      builder: (context, state) => const ShowProtoDetails(),
    ),
    GoRoute(
      path: '/chat',
      builder: (context, state) => const Chat(),
    ),
    GoRoute(
      path: '/dms',
      builder: (context, state) => DMs(),
    ),
    GoRoute(
      path: '/saved',
      builder: (context, state) => const Saved(),
    ),
    GoRoute(
      path: '/notifications',
      builder: (context, state) => const Notifications(),
    ),
    GoRoute(
      path: '/report',
      builder: (context, state) => const Report(),
    ),
    GoRoute(
      path: '/myproject',
      builder: (context, state) => const MyProject(),
    ),
    GoRoute(
      path: '/review',
      builder: (context, state) => const Review(),
    ),
    GoRoute(
      path: '/createoffer',
      builder: (context, state) => const CreateOffer(),
    ),
    GoRoute(
      path: '/editoffer',
      builder: (context, state) => const EditOffer(),
    ),
    GoRoute(
      path: '/offerdetails',
      builder: (context, state) => const OfferDetails(),
    ),
    GoRoute(
      path: '/createproject',
      builder: (context, state) => const CreateProject(),
    ),
    GoRoute(
      path: '/editproject',
      builder: (context, state) => const EditProject(),
    ),
    GoRoute(
      path: '/showprojectdetails',
      builder: (context, state) => const ShowProjectDetails(),
    ),
    GoRoute(
      path: '/searsh',
      builder: (context, state) => const Searsh(),
    ),
    GoRoute(
      path: '/sort',
      builder: (context, state) => const Sort(),
    ),
    GoRoute(
      path: '/projectstatusdetails',
      builder: (context, state) => const ProjectStatusDetails(),
    ),
  ]);

  /* redirect: (context, state) {
      final authState = context.read<AuthBloc>().state;
      final isAuthenticated = authState is AuthAuthenticated;

      if (isAuthenticated && state.uri.toString() == '/') {
        return '/home';
      } else if (!isAuthenticated && state.uri.toString() == '/home') {
        return '/';
      }
      return null;
    },*/
}
