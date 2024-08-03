import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:freelance_job_portal/core/errors/failures.dart';
import 'package:freelance_job_portal/features/projects/data/model/create_project_model.dart';
import 'package:freelance_job_portal/features/projects/data/model/edit_project_model.dart';
import 'package:freelance_job_portal/features/projects/data/model/project_model/project_model.dart';
import 'package:freelance_job_portal/features/projects/data/repo/project_repo.dart';
import '../../../../core/utils/api_service.dart';

class ProjectRepoImp implements ProjectRepo {
  final ApiService _apiService;

  ProjectRepoImp(this._apiService);

  @override
  Future<Either<Failure, ProjectModel>> getProjectDetails(int projectId) async {
    try {
      final response = await _apiService.get('projects/$projectId');
      final project = ProjectModel.fromJson(response);
      return Right(project);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, CreateProjectModel>> createProject(
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
        "projectCategoriesIds": project.projectCategoriesIds,
      });
      return Right(CreateProjectModel.fromJson(response));
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, EditProjectModel>> updateProject(
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
      return Right(EditProjectModel.fromJson(response));
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }
}

// {
//         "name": project.name,
//         "description": project.description,
//         "minBudget": project.minBudget,
//         "maxBudget": project.maxBudget,
//         "ExpectedDuration": project.expectedDuration,
//         "clientProfileId": project.clientProfileId,
//         "projectSkillIds": project.projectSkillIds,
//         "projectCategoriesIds": project.projectCategoriesIds,
//       }

//@override
// Future<Either<Failure, List<String>>> getCategories() async {
//   try {
//     final response = await _apiService.get('/api/v1/categories');
//     return Right(List<String>.from(response['categories']));
//   } catch (e) {
//     return Left(ServerFailure(errMessage: 'Failed to get categories: $e'));
//   }
// }

// @override
//  Future<Either<Failure, List<String>>> getSkills() async {
//   try {
//     final response = await _apiService.get('/api/v1/skills');
//     return Right(List<String>.from(response['skills']));
//   } catch (e) {
//     return Left(ServerFailure(errMessage: 'Failed to get skills: $e'));
//   }
// }
