import 'package:dartz/dartz.dart';
import 'package:freelance_job_portal/core/errors/failures.dart';
import 'package:freelance_job_portal/features/protofolio/data/models/portofolio_job/portofolio_job/portofolio_job.dart';

abstract class PortofolioRepo {
  Future<Either<Failure, List<PortofolioJob>>> getPortofolios(
      int workerProfileId);
  Future<Either<Failure, PortofolioJob>> createPortofolioJob(
      Map<String, dynamic> jobData);
  Future<Either<Failure, PortofolioJob>> editPortofolioJob(
      Map<String, dynamic> jobData, int jobId);
  Future<Either<Failure, void>> deletePortofolioJob(int jobId);
  Future<Either<Failure, Map<String, dynamic>>> like(int jobId);
  Future<Either<Failure, Map<String, dynamic>>> view(int jobId);
  Future<Either<Failure, bool>> isLiked(int jobId);
}
