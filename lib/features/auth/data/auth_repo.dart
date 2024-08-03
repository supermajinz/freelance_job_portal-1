import 'package:dartz/dartz.dart';
import 'package:freelance_job_portal/core/errors/failures.dart';
import 'package:freelance_job_portal/features/auth/data/models/user.dart';

abstract class AuthRepo {
  Future<Either<Failure, String>> register(User user, String password);
  Future<Either<Failure, String>> login(String phone, String password);
  Future<Either<Failure, Map<String, String>>> verify(String code);
  // Future<Either<Failure,String>> changePassword(String oldPassword,newPassword,confirmPassword);
  Future<Either<Failure, bool>> refreshToken();
  Future<Either<Failure, bool>> logout();
  Future<Either<Failure, User>> getUser();
  Future<Either<Failure, int>> getUserId();
}
