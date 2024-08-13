import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:freelance_job_portal/core/errors/failures.dart';
import 'package:freelance_job_portal/core/utils/api_service.dart';
import 'package:freelance_job_portal/features/projects/data/model/project_model/project_model.dart';
import 'package:freelance_job_portal/features/saved/data/repo/favorite_repo.dart';

import '../../../auth/data/models/user.dart';

class FavoriteRepoImpl implements FavoriteRepo {
  final ApiService apiService;

  FavoriteRepoImpl(this.apiService);

  @override
  Future<Either<Failure, Unit>> addProjectToFavorite(
      int userId, int projectId) async {
    try {
      await apiService.post('users/$userId/projects/$projectId', {});
      return const Right(unit);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> addUserToFavorite(
      int userId, int favoriteUserId) async {
    try {
      await apiService.post('users/$userId/favorites/$favoriteUserId', {});
      return const Right(unit);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteProjectFromFavorite(
      int userId, int projectId) async {
    try {
      await apiService.delete('users/$userId/projects/$projectId');
      return const Right(unit);
    } catch (e) {
      print("will $e");
      print("will ${e.runtimeType}");
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteUserFromFavorite(
      int userId, int favoriteUserId) async {
    try {
      await apiService.delete('users/$userId/favorites/$favoriteUserId');
      return const Right(unit);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ProjectModel>>> getFavoriteProject(
      int userId) async {
    try {
      var data = await apiService.get('users/$userId/projects');
      List<ProjectModel> projects = [];
      for (var item in data['favoriteProjects']) {
        projects.add(ProjectModel.fromJson(item));
        print("projects-------------------____________________________________${projects}");
         print("____________________________________${item}");
      }
      return Right(projects);
    } catch (e) {
      if (e is DioException) {
          
        return Left(ServerFailure.fromDioException(e));
      }
      print(e.runtimeType);
      print(e);
      if(e is TypeError){
        print(e.stackTrace);
      }
      return Left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<User>>> getFavoriteUser(int userId) async {
    try {
      var data = await apiService.get('users/$userId/favorites');
      List<User> users = [];
      for (var item in data['favoriteUsers']) {
        users.add(User.fromJson(item));
      }
      return Right(users);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(errMessage: e.toString()));
    }
  }
}
