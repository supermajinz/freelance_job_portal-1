// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:freelance_job_portal/core/errors/failures.dart';
import 'package:freelance_job_portal/core/utils/api_service.dart';
import 'package:freelance_job_portal/features/auth/data/auth_repo.dart';
import 'package:freelance_job_portal/features/auth/data/auth_token_service.dart';
import 'package:freelance_job_portal/features/auth/data/models/user.dart';

class AuthRepoImpl implements AuthRepo {
  final regEndpoint = 'auth/register';
  final logEndPoint = 'auth/first-step-login';
  final verifyEndpoint = 'auth/second-step-login';

  final ApiService _apiService;
  final AuthTokenService _authTokenService;

  AuthRepoImpl(this._apiService, this._authTokenService);

  @override
  Future<Either<Failure, String>> login(String phone, String password) async {
    try {
      final response = await _apiService.post(logEndPoint, {
        'phone': phone,
        'password': password,
      });
      return Right(response['message']);
    } on ServerFailure catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Failure, String>> register(User user, String password) async {
    try {
      final Map<String, dynamic> userData = user.toJson();
      userData['password'] = password;
      final response = await _apiService.post(regEndpoint, userData);
      return Right(response['message']);
    } on ServerFailure catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Failure, Map<String, String>>> verify(String code) async {
    try {
      final response = await _apiService.post(verifyEndpoint, {'code': code});
      await _authTokenService.saveToken(
          'access_token', response['access_token']);
      await _authTokenService.saveToken(
          'refresh_token', response['refresh_token']);
      return Right({
        'access_token': response['access_token'],
        'refresh_token': response['refresh_token'],
      });
    } on ServerFailure catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Failure, bool>> refreshToken() async {
    try {
      final success = await _apiService.refreshToken();
      if (success) {
        return const Right(true);
      } else {
        return Left(ServerFailure(errMessage: 'Failed to refresh token'));
      }
    } on ServerFailure catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Failure, bool>> logout() async {
    try {
      await _apiService.post('auth/logout', {});

      await _authTokenService.deleteToken('access_token');
      await _authTokenService.deleteToken('refresh_token');

      return const Right(true);
    } on ServerFailure catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Failure, User>> getUser() async {
    try {
      final response = await _apiService.get('auditor/current-user');
      return Right(User.fromJson(response));
    } on ServerFailure catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Failure, int>> getUserId() async {
    try {
      final response = await _apiService.get('auditor/current-auditor-id');
      print(response);
      return right(response['data']);
    } on ServerFailure catch (e) {
      return Left(e);
    }
  }
}
