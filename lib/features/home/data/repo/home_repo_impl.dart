import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:freelance_job_portal/core/errors/failures.dart';
import 'package:freelance_job_portal/core/utils/api_service.dart';
import 'package:freelance_job_portal/features/home/data/model/caregories/caregories.dart';
import 'package:freelance_job_portal/features/home/data/model/skills/skills.dart';
import 'package:freelance_job_portal/features/home/data/repo/home_repo.dart';
import 'package:freelance_job_portal/features/projects/data/model/project_model/project_model.dart';

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
  // final response = await http.get(Uri.parse('YOUR_API_ENDPOINT/$categoryId'));
  // if (response.statusCode == 200) {
  //   Map<String, dynamic> jsonMap = json.decode(response.body);
  //   List<dynamic> jsonList = jsonMap['clientProfiles']['body'];
  //   return jsonList.map((json) => Skill.fromJson(json)).toList();
  // } else {
  //   throw Exception('Failed to load skills');
  // }

  @override
  Future<Either<Failure, List<ProjectModel>>> fetchProjectMostCommon() async {
    try {
      var data = await apiService.get("");
      List<ProjectModel> project = [];
      for (var item in data['']) {
        project.add(ProjectModel.fromJson(item));
      }
      return right(project);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ProjectModel>>> fetchProjectSuggestion() async {
    try {
      var data = await apiService.get("");
      List<ProjectModel> project = [];
      for (var item in data['']) {
        project.add(ProjectModel.fromJson(item));
      }
      return right(project);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }
}
