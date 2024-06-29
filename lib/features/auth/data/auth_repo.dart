import 'package:freelance_job_portal/features/auth/presentation/views/login.dart';

abstract class AuthRepo {
  register();
  login();
  verify();
  changePassword();

  refreshToken();
}
