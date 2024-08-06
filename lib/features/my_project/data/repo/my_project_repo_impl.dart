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
  Future<Either<Failure, ProjectModel>> getMyProject() async {
    try {
      final response = await _apiService.get('');
      final project = ProjectModel.fromJson(response);
      return Right(project);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }
}
