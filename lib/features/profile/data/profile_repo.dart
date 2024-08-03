import 'package:dartz/dartz.dart';
import 'package:freelance_job_portal/core/errors/failures.dart';
import 'package:freelance_job_portal/features/profile/data/models/profile/client_profile.dart';

abstract class ProfileRepo {
  Future<Either<Failure, List<ClientProfile>>> getUserProfiles(int userId);
  Future<Either<Failure, ClientProfile>> getProfile(int userId, int profileId);
  Future<Either<Failure, Map<String, dynamic>>> createProfile(
      Map<String, dynamic> profileData);
  Future<Either<Failure, Map<String, dynamic>>> editProfile();
  Future<Either<Failure, String>> addPhoto(Map<String, dynamic> photoData);
  Future<Either<Failure, String>> addSkill(Map<String, dynamic> skillData);
}
