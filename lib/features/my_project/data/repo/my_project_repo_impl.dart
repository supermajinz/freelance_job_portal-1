import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:freelance_job_portal/core/errors/failures.dart';
import 'package:freelance_job_portal/features/my_project/data/repo/my_project_repo.dart';

import '../../../../core/utils/api_service.dart';
import '../../../projects/data/model/project_model/project_model.dart';

class MyProjectRepoImpl implements MyProjectRepo {
  final ApiService _apiService;

  MyProjectRepoImpl(this._apiService);
  @override
  Future<Either<Failure, List<ProjectModel>>> getMyProject(int userId) async {
    try {
      var data = await _apiService.get('projects/byUser/$userId');
      List<ProjectModel> projects = [];
      for (var item in data['projects']) {
        projects.add(ProjectModel.fromJson(item));
        print("ahmad---------------------------------------  $item");
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
