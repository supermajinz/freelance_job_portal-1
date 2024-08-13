import 'package:dartz/dartz.dart';
import 'package:freelance_job_portal/core/errors/failures.dart';
import 'package:freelance_job_portal/core/utils/api_service.dart';
import 'package:freelance_job_portal/features/protofolio/data/models/portofolio_job/portofolio_job/portofolio_job.dart';
import 'package:freelance_job_portal/features/protofolio/data/repo/portofolio_repo.dart';

class PortofolioRepoImpl extends PortofolioRepo {
  final ApiService _apiService;

  PortofolioRepoImpl(this._apiService);

  @override
  Future<Either<Failure, PortofolioJob>> createPortofolioJob(
      Map<String, dynamic> jobData) async {
    try {
      final response = await _apiService.post('jobs', jobData);
      final portofolioJob = PortofolioJob.fromJson(response);
      return Right(portofolioJob);
    } catch (e) {
      return Left(
          ServerFailure(errMessage: 'Failed to create job: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, void>> deletePortofolioJob(int jobId) async {
    try {
      await _apiService.delete('jobs/$jobId');
      return const Right(null); // Successfully deleted, return null or unit
    } catch (e) {
      return Left(
          ServerFailure(errMessage: 'Failed to delete job: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, PortofolioJob>> editPortofolioJob(
      Map<String, dynamic> jobData, int jobId) async {
    try {
      final response = await _apiService.put('jobs/$jobId', jobData);
      print('edit response $response');
      final updatedJob = PortofolioJob.fromJson(response);
      return Right(updatedJob);
    } catch (e) {
      return Left(
          ServerFailure(errMessage: 'Failed to edit job: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, List<PortofolioJob>>> getPortofolios(
      int workerProfileId) async {
    print("will try get for $workerProfileId portofolios");
    try {
      final response = await _apiService.get('jobs/$workerProfileId');
      print(response);

      if (response['data'] is List) {
        final jobList = response['data'] as List;
        print("jobslist: $jobList");

        final List<PortofolioJob> portofolios = jobList.map((jobData) {
          print("jb: $jobData");
          final PortofolioJob singlePortofolio =
              PortofolioJob.fromJson(jobData);
          print("sg : $singlePortofolio");
          return singlePortofolio;
        }).toList();
        print('portofolios: $portofolios');
        return Right(portofolios);
      } else {
        return Left(ServerFailure(errMessage: 'Invalid response format'));
      }
    } catch (e) {
      return Left(ServerFailure(
          errMessage: 'Failed to fetch portofolios: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, bool>> isLiked(int jobId) async {
    try {
      final response =
          await _apiService.get('jobs/is-liked', params: {'jobId': jobId});
      if (response['data'] is bool) {
        return Right(response['data']);
      } else {
        return Left(
            ServerFailure(errMessage: 'Invalid response format for isLiked'));
      }
    } catch (e) {
      return Left(
          ServerFailure(errMessage: 'Failed to check like: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> like(int jobId) async {
    try {
      final response =
          await _apiService.post('jobs/add-like', {'jobId': jobId});
      return Right(response);
    } catch (e) {
      return Left(
          ServerFailure(errMessage: 'Failed to like job: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> view(int jobId) async {
    try {
      final response =
          await _apiService.post('jobs/add-view', {'jobId': jobId});
      return Right(response);
    } catch (e) {
      return Left(
          ServerFailure(errMessage: 'Failed to view job: ${e.toString()}'));
    }
  }
}
