import 'package:dartz/dartz.dart';
import 'package:freelance_job_portal/core/errors/failures.dart';
import 'package:freelance_job_portal/features/auth/data/models/user.dart';
import '../../../projects/data/model/project_model/project_model.dart';

abstract class FavoriteRepo {
  Future<Either<Failure, Unit>> addProjectToFavorite(int userId, int projectId);
  Future<Either<Failure, Unit>> addUserToFavorite(
      int userId, int favoriteUserId);
  Future<Either<Failure, Unit>> deleteProjectFromFavorite(
      int userId, int projectId);
  Future<Either<Failure, Unit>> deleteUserFromFavorite(
      int userId, int favoriteUserId);
  Future<Either<Failure, List<ProjectModel>>> getFavoriteProject(int userId);
  Future<Either<Failure, List<User>>> getFavoriteUser(int userId);
}
