import 'package:dartz/dartz.dart';
import 'package:freelance_job_portal/core/errors/failures.dart';
import 'package:freelance_job_portal/features/review/data/model/rate_model/profile_rates.dart';
import 'package:freelance_job_portal/features/review/data/model/review_model.dart';

abstract class ReviewRepo {
  Future<Either<Failure, ReviewModel>> addRate(
      int projectId, Map<String, dynamic> reviewData);
  Future<Either<Failure, ProfileRates>> getProfileRate(
      int profileId, bool isClient);
}
