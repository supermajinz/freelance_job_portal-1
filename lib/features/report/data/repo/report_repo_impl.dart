import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:freelance_job_portal/core/errors/failures.dart';
import 'package:freelance_job_portal/core/utils/api_service.dart';
import 'package:freelance_job_portal/features/report/data/model/report_model.dart';
import 'package:freelance_job_portal/features/report/data/repo/report_repo.dart';

class ReportRepoImpl implements ReportRepo {
  final ApiService apiService;

  ReportRepoImpl(this.apiService);

  @override
  Future<Either<Failure, ReportModel>> addReport(
      Map<String, dynamic> reportData) async {
    try {
      final response = await apiService.post('reports', reportData);
      print(reportData);
      return Right(ReportModel.fromJson(response));
    } catch (e) {
      if (e is DioException) {
        print(e.stackTrace);
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }
}
