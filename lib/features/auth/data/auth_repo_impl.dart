// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:freelance_job_portal/core/utils/api_service.dart';
import 'package:freelance_job_portal/features/auth/data/auth_repo.dart';
import 'package:freelance_job_portal/features/auth/data/models/user.dart';

class AuthRepoImpl implements AuthRepo {
  final ApiService apiService;
  AuthRepoImpl({
    required this.apiService,
  });
  @override
  changePassword() {
    // TODO: implement changePassword
    throw UnimplementedError();
  }

  @override
  login() {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  refreshToken() {
    // TODO: implement refreshToken
    throw UnimplementedError();
  }

  @override
  register() async {
    var data = await apiService.post(endPoint: 'auth/register', data: {});
  }

  @override
  verify() {
    // TODO: implement verify
    throw UnimplementedError();
  }
}
