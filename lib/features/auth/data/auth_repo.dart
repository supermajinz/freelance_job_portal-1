import 'package:dartz/dartz.dart';
import 'package:freelance_job_portal/core/errors/failures.dart';

abstract class AuthRepo {
  Future<Either<Failure, Map>> register();
  login();
  verify();
  changePassword();
  refreshToken();
}
