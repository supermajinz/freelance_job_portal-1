import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:freelance_job_portal/core/errors/failures.dart';
import 'package:freelance_job_portal/core/utils/api_service.dart';
import 'package:freelance_job_portal/features/review/data/model/rate_model/profile_rates.dart';
import 'package:freelance_job_portal/features/review/data/repo/review_repo.dart';

import '../model/review_model.dart';

class ReviewRepoImpl implements ReviewRepo {
  final ApiService apiService;

  ReviewRepoImpl(this.apiService);
  @override
  Future<Either<Failure, ReviewModel>> addRate(
      int projectId, Map<String, dynamic> reviewData) async {
    try {
      final response =
          await apiService.post('rate?projectId=$projectId', reviewData);
      return Right(ReviewModel.fromJson(response));
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, ProfileRates>> getProfileRate(int profileId) async {
    try {
      var data = await apiService.get('rate/profile/$profileId');
      return Right(ProfileRates.fromMap(data));
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(errMessage: e.toString()));
    }
  }
}
