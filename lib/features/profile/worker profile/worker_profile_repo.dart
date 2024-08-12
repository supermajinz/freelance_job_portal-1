import 'package:dartz/dartz.dart';
import 'package:freelance_job_portal/core/errors/failures.dart';
import 'package:freelance_job_portal/core/utils/api_service.dart';
import 'package:freelance_job_portal/features/profile/data/models/profile/worker_Profile/worker_profile.dart';
import 'package:freelance_job_portal/features/profile/worker%20profile/worker_profile_repo_abstract.dart';

class WorkerProfileRepoImpl extends WorkerProfileRepo {
  final ApiService _apiService;

  WorkerProfileRepoImpl({required ApiService apiService})
      : _apiService = apiService;

  @override
  Future<Either<Failure, String>> addPhoto(
      Map<String, dynamic> photoData) async {
    try {
      final response =
          await _apiService.post('workerProfiles/add-photo', photoData);
      return Right(response['message']);
    } catch (e) {
      return Left(ServerFailure(
          errMessage: 'Failed to fetch create profile: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, String>> addSkill(
      Map<String, dynamic> skillData) async {
    try {
      final response =
          await _apiService.post('workerProfiles/add-skill', skillData);
      return Right(response['message']);
    } catch (e) {
      return Left(ServerFailure(
          errMessage: 'Failed to fetch create profile: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, WorkerProfile>> createProfile(
      Map<String, dynamic> profileData) async {
    try {
      final response = await _apiService.post('workerProfiles', profileData);
      return Right(WorkerProfile.fromMap(response));
    } catch (e) {
      return Left(ServerFailure(
          errMessage: 'Failed to fetch create profile: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, WorkerProfile>> editProfile(
      Map<String, dynamic> profileData, int profileId) async {
    try {
      final response =
          await _apiService.put('workerProfiles/$profileId', profileData);
      return Right(WorkerProfile.fromMap(response));
    } catch (e) {
      return Left(ServerFailure(
          errMessage: 'Failed to fetch create profile: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, List<WorkerProfile>>> getUserProfiles(
      int userId) async {
    try {
      final response = await _apiService.get('workerProfiles/$userId');

      if (response['workerProfiles'] is List) {
        final profilesList = response['workerProfiles'] as List;
        final List<WorkerProfile> workerProfiles = profilesList
            .map((profileData) => WorkerProfile.fromMap(profileData))
            .toList();

        // Even if the list is empty, we return it as a successful result
        return Right(workerProfiles);
      } else {
        return Left(ServerFailure(errMessage: 'Invalid response format'));
      }
    } catch (e) {
      return Left(ServerFailure(
          errMessage: 'Failed to fetch user profiles: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, WorkerProfile>> getProfile(
      int userId, int profileId) async {
    final profilesResult = await getUserProfiles(userId);

    return profilesResult.fold(
      (failure) => Left(failure),
      (profiles) => _findProfileById(profiles, profileId),
    );
  }

// Overloaded method to get a single profile from an existing list
  Either<Failure, WorkerProfile> getProfileFromList(
      List<WorkerProfile> profiles, int profileId) {
    return _findProfileById(profiles, profileId);
  }

// Private helper method to find a profile by ID
  Either<Failure, WorkerProfile> _findProfileById(
      List<WorkerProfile> profiles, int profileId) {
    try {
      final profile = profiles.firstWhere((p) => p.id == profileId);
      return Right(profile);
    } catch (e) {
      return Left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> deletePhoto(
      Map<String, dynamic> photoData) async {
    try {
      print('repo: $photoData');

      final response =
          await _apiService.deletePost('workerProfiles/add-photo', photoData);
      return Right(response['message']);
    } catch (e) {
      return Left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> deleteSkill(
      Map<String, dynamic> skillData) async {
    try {
      print('repo: $skillData');
      final response = await _apiService.deletePost(
          'workerProfiles/add-skill', skillData); //TODO whats the endpoint
      return Right(response['message']);
    } catch (e) {
      return Left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteProfile(int profileId) async {
    try {
      await _apiService.deleteNoResponse('workerProfiles/$profileId');
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(errMessage: e.toString()));
    }
  }
}
