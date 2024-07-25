import 'package:dartz/dartz.dart';
import 'package:freelance_job_portal/core/errors/failures.dart';
import 'package:freelance_job_portal/core/utils/api_service.dart';
import 'package:freelance_job_portal/features/profile/data/models/profile/client_profile.dart';
import 'package:freelance_job_portal/features/profile/data/profile_repo.dart';

class WorkerprofileRepoImpl implements ProfileRepo {
  final ApiService _apiService;

  WorkerprofileRepoImpl({required ApiService apiService})
      : _apiService = apiService;
  @override
  Future<Either<Failure, String>> addPhoto(Map<String, dynamic> photoData) {
    // TODO: implement addPhoto
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> addSkill(Map<String, dynamic> skillData) {
    // TODO: implement addSkill
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> createProfile(
      Map<String, dynamic> profileData) {
    // TODO: implement createProfile
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> editProfile() {
    // TODO: implement editProfile
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, ClientProfile>> getProfile(int id) async {
    final profileId = id;
    try {
      final response = await _apiService.get('clientProfiles/$profileId');
      return Right(ClientProfile.fromMap(response));
    } on ServerFailure catch (e) {
      return Left(e);
    }
  }
}
