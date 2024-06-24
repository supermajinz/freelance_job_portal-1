import 'package:freelance_job_portal/features/auth/presentation/views/verification_code.dart';
import 'package:freelance_job_portal/features/auth/presentation/views/forget_password.dart';
import 'package:freelance_job_portal/features/auth/presentation/views/resetpassword.dart';
import 'package:freelance_job_portal/features/auth/presentation/views/signup.dart';
import 'package:freelance_job_portal/features/auth/presentation/views/verification_signup.dart';
import 'package:freelance_job_portal/features/home/presentation/views/home.dart';
import 'package:freelance_job_portal/features/wallet/presentation/views/wallet.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static final router = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) =>  const Wallet(),
    ),
    GoRoute(
      path: '/signup',
      builder: (context, state) => const Signup(),
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
  ]);
}
