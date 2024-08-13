import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:freelance_job_portal/core/errors/failures.dart';
import 'package:freelance_job_portal/features/projects/data/model/create_project_model.dart';
import 'package:freelance_job_portal/features/projects/data/model/edit_project_model.dart';
import 'package:freelance_job_portal/features/projects/data/model/project_model/project_model.dart';
import 'package:freelance_job_portal/features/projects/data/repo/project_repo.dart';
import '../../../../core/utils/api_service.dart';
import '../../../offers/data/model/offers_model/offers_model.dart';

class ProjectRepoImp implements ProjectRepo {
  final ApiService _apiService;

  ProjectRepoImp(this._apiService);

  @override
  Future<Either<Failure, ProjectModel>> createProject(
      CreateProjectModel project) async {
    try {
      final response = await _apiService.post('projects', {
        "name": project.name,
        "description": project.description,
        "minBudget": project.minBudget,
        "maxBudget": project.maxBudget,
        "ExpectedDuration": project.expectedDuration,
        "clientProfileId": project.clientProfileId,
        "projectSkillIds": project.projectSkillIds,
        "projectCategoryId": project.projectCategory,
      });
      return Right(ProjectModel.fromJson(response));
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, ProjectModel>> updateProject(
      EditProjectModel editProjectModel, int projectId) async {
    try {
      final response = await _apiService.patch("projects/$projectId", {
        "name": editProjectModel.name,
        "description": editProjectModel.description,
        "minBudget": editProjectModel.minBudget,
        "maxBudget": editProjectModel.maxBudget,
        "ExpectedDuration": editProjectModel.expectedDuration,
        "status": editProjectModel.status,
        "projectSkillIds": editProjectModel.projectSkillIds,
        "projectCategoriesIds": editProjectModel.projectCategoriesIds
      });
      return Right(ProjectModel.fromJson(response));
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<OffersModel>>> getOffersByProject(
      int projectId) async {
    try {
      var data = await _apiService.get('offers/byProject/$projectId');
      List<OffersModel> offer = [];
      for (var item in data['offers']) {
        offer.add(OffersModel.fromJson(item));
      }
      return Right(offer);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteProject(int projectId) async {
    try {
      await _apiService.delete('projects/$projectId');
      return const Right(unit);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> closeProject(int projectId) async {
    try {
      await _apiService.post('projects/close/$projectId', {});
      return const Right(unit);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> acceptOffer(int offerId) async {
    try {
      await _apiService.post('offers/accept/$offerId', {});
      return const Right(unit);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> rejectOffer(int offerId) async {
    try {
      await _apiService.post('offers/reject/$offerId', {});
      return const Right(unit);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }
}
