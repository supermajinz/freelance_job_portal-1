import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:freelance_job_portal/core/utils/api_service.dart';
import 'package:freelance_job_portal/features/searsh/data/repo/search_repo_.dart';
import '../../../../core/errors/failures.dart';
import '../../../projects/data/model/project_model/project_model.dart';

class SearchRepoImpl implements SearchRepo {
  final ApiService apiService;

  SearchRepoImpl(this.apiService);

  @override
  Future<Either<Failure, List<ProjectModel>>> searchProjects({
    Map<String, dynamic>? params,
  }) async {
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
