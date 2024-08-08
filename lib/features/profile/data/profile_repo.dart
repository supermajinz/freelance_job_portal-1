import 'package:dartz/dartz.dart';
import 'package:freelance_job_portal/core/errors/failures.dart';
import 'package:freelance_job_portal/features/profile/data/models/profile/client_profile.dart';

abstract class ProfileRepo {
  Future<Either<Failure, List<ClientProfile>>> getUserProfiles(int userId);
  Future<Either<Failure, ClientProfile>> getProfile(int userId, int profileId);
  Future<Either<Failure, ClientProfile>> createProfile(
      Map<String, dynamic> profileData);
  Future<Either<Failure, ClientProfile>> editProfile(
      Map<String, dynamic> profileData, int profileId);
  Future<Either<Failure, String>> addPhoto(Map<String, dynamic> photoData);
  Future<Either<Failure, String>> addSkill(Map<String, dynamic> skillData);
  Future<Either<Failure, String>> deletePhoto(Map<String, dynamic> photoData);
  Future<Either<Failure, String>> deleteSkill(Map<String, dynamic> skillData);
  Future<Either<Failure, void>> deleteProfile(int profileId);
}
