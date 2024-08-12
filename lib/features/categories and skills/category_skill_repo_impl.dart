import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:freelance_job_portal/core/errors/failures.dart';
import 'package:freelance_job_portal/core/utils/api_service.dart';
import 'package:freelance_job_portal/features/categories%20and%20skills/category_skill_repo.dart';
import 'package:freelance_job_portal/features/categories%20and%20skills/models/categories/category.dart';
import 'package:freelance_job_portal/features/categories%20and%20skills/models/job_title.dart';
import 'package:freelance_job_portal/features/categories%20and%20skills/models/skill.dart';

class CategorySkillRepoImpl extends CategorySkillRepo {
  final ApiService _apiService;

  CategorySkillRepoImpl(this._apiService);
  @override
  Future<Either<Failure, List<Category>>> getCategories() async {
    try {
      var data = await _apiService.get('category');
      List<Category> category = [];
      for (var item in data['categories']) {
        category.add(Category.fromJson(item));
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
  Future<Either<Failure, List<Skill>>> getSkills(int categoryId) async {
    try {
      var data = await _apiService.get('skill/$categoryId');
      List<Skill> skill = [];
      for (var item in data['skills']['body']) {
        skill.add(Skill.fromJson(item));
        // print(item);
      }
      //print(skill);
      return right(skill);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<JobTitle>>> getJobDesignations() async {
    try {
      final response = await _apiService.get('job-titles');
      List<JobTitle> jobTitles = [];
      for (var item in response['jobTitles']) {
        jobTitles.add(JobTitle.fromJson(item));
      }
      return right(jobTitles);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }
}
