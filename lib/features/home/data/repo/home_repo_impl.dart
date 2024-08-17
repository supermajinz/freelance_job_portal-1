import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:freelance_job_portal/core/errors/failures.dart';
import 'package:freelance_job_portal/core/utils/api_service.dart';
import 'package:freelance_job_portal/features/home/data/model/caregories/caregories.dart';
import 'package:freelance_job_portal/features/home/data/model/skills/skills.dart';
import 'package:freelance_job_portal/features/home/data/repo/home_repo.dart';

import '../../../projects/data/model/project_model/project_model.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;

  HomeRepoImpl(this.apiService);
  @override
  Future<Either<Failure, List<Categories>>> fetchCategories() async {
    try {
      var data = await apiService.get('category');
      List<Categories> category = [];
      for (var item in data['categories']) {
        category.add(Categories.fromJson(item));
      }
      return right(category);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Skills>>> fetchSkillsByCategory(
      int categoryId) async {
    try {
      var data = await apiService.get('skill/$categoryId');
      List<Skills> skill = [];
      for (var item in data['skills']['body']) {
        skill.add(Skills.fromJson(item));
      }
      return right(skill);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }
    @override
  Future<Either<Failure, List<ProjectModel>>> fetchProjectMostCommon(
      {Map<String, dynamic>? params}) async {
    try {
      var data = await apiService.get('projects', params: params);

      List<ProjectModel> projects = [];
      for (var item in data['projects']) {
        projects.add(ProjectModel.fromJson(item));
      }
      return Right(projects);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ProjectModel>>> fetchProjectSuggestion(
      {Map<String, dynamic>? params}) async {
    try {
      var data = await apiService.get('projects', params: params);

      List<ProjectModel> projects = [];
      for (var item in data['projects']) {
        projects.add(ProjectModel.fromJson(item));
      }
      return Right(projects);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }
}
  