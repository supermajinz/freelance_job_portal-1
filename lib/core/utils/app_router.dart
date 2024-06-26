import 'package:freelance_job_portal/features/auth/presentation/views/login.dart';
import 'package:freelance_job_portal/features/auth/presentation/views/verification_code.dart';
import 'package:freelance_job_portal/features/auth/presentation/views/forget_password.dart';
import 'package:freelance_job_portal/features/auth/presentation/views/resetpassword.dart';
import 'package:freelance_job_portal/features/auth/presentation/views/signup.dart';
import 'package:freelance_job_portal/features/auth/presentation/views/verification_signup.dart';
import 'package:freelance_job_portal/features/chat/presentation/views/chat.dart';
import 'package:freelance_job_portal/features/chat/presentation/views/dms.dart';
import 'package:freelance_job_portal/features/home/presentation/views/home.dart';
import 'package:freelance_job_portal/features/notifications/presentation/views/notifications.dart';
import 'package:freelance_job_portal/features/onboarding/presentation/views/onboarding_view.dart';
import 'package:freelance_job_portal/features/profile/presentation/views/profile.dart';
import 'package:freelance_job_portal/features/saved/presentation/views/saved.dart';
import 'package:freelance_job_portal/features/wallet/presentation/views/deposit.dart';
import 'package:freelance_job_portal/features/wallet/presentation/views/wallet.dart';
import 'package:freelance_job_portal/features/wallet/presentation/views/withdraw.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static final router = GoRouter(routes: [
    GoRoute(
      path: '/',
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
      path: '/chat',
      builder: (context, state) => const Chat(),
    ),
    GoRoute(
      path: '/dms',
      builder: (context, state) => const DMs(),
    ),
    GoRoute(
      path: '/saved',
      builder: (context, state) => const Saved(),
    ),
    GoRoute(
      path: '/notifications',
      builder: (context, state) => const Notifications(),
    ),
  ]);
}
