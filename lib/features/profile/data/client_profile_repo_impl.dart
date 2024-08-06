import 'package:dartz/dartz.dart';
import 'package:freelance_job_portal/core/errors/failures.dart';
import 'package:freelance_job_portal/core/utils/api_service.dart';
import 'package:freelance_job_portal/features/profile/data/models/profile/client_profile.dart';
import 'package:freelance_job_portal/features/profile/data/profile_repo.dart';

class ClientProfileRepoImpl implements ProfileRepo {
  final ApiService _apiService;

  ClientProfileRepoImpl({required ApiService apiService})
      : _apiService = apiService;
  @override
  Future<Either<Failure, String>> addPhoto(
      Map<String, dynamic> photoData) async {
    try {
      final response =
          await _apiService.post('clientProfiles/add-photo', photoData);
      return Right(response['message']);
    } catch (e) {
      return Left(ServerFailure(
          errMessage: 'Failed to fetch create profile: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, String>> addSkill(Map<String, dynamic> skillData) async {
    try {
      final response =
          await _apiService.post('clientProfiles/add-skill', skillData);
      return Right(response['message']);
    } catch (e) {
      return Left(ServerFailure(
          errMessage: 'Failed to fetch create profile: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, ClientProfile>> createProfile(
      Map<String, dynamic> profileData) async {
    try {
      final response = await _apiService.post('clientProfiles', profileData);
      return Right(ClientProfile.fromMap(response));
    } catch (e) {
      return Left(ServerFailure(
          errMessage: 'Failed to fetch create profile: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> editProfile() {
    // TODO: implement editProfile
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<ClientProfile>>> getUserProfiles(
      int userId) async {
    try {
      final response = await _apiService.get('clientProfiles/$userId');

      if (response['clientProfiles'] is List) {
        final profilesList = response['clientProfiles'] as List;
        final List<ClientProfile> clientProfiles = profilesList
            .map((profileData) => ClientProfile.fromMap(profileData))
            .toList();

        // Even if the list is empty, we return it as a successful result
        return Right(clientProfiles);
      } else {
        return Left(ServerFailure(errMessage: 'Invalid response format'));
      }
    } catch (e) {
      return Left(ServerFailure(
          errMessage: 'Failed to fetch user profiles: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, ClientProfile>> getProfile(
      int userId, int profileId) async {
    final profilesResult = await getUserProfiles(userId);

    return profilesResult.fold(
      (failure) => Left(failure),
      (profiles) => _findProfileById(profiles, profileId),
    );
  }

// Overloaded method to get a single profile from an existing list
  Either<Failure, ClientProfile> getProfileFromList(
      List<ClientProfile> profiles, int profileId) {
    return _findProfileById(profiles, profileId);
  }

// Private helper method to find a profile by ID
  Either<Failure, ClientProfile> _findProfileById(
      List<ClientProfile> profiles, int profileId) {
    try {
      final profile = profiles.firstWhere((p) => p.id == profileId);
      return Right(profile);
    } catch (e) {
      return Left(ServerFailure(errMessage: 'Profile not found'));
    }
  }
}
