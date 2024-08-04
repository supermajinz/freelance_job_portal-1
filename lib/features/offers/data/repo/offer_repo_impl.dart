import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:freelance_job_portal/core/errors/failures.dart';
import 'package:freelance_job_portal/core/utils/api_service.dart';
import 'package:freelance_job_portal/features/offers/data/model/offer_model/offer_model.dart';
import 'package:freelance_job_portal/features/offers/data/repo/offer_repo.dart';

import '../model/offers_model/offers_model.dart';

class OfferRepoImpl implements OfferRepo {
  final ApiService _apiService;

  OfferRepoImpl(this._apiService);

  @override
  Future<Either<Failure, OffersModel>> createOffer(
      Map<String, dynamic> offerData) async {
    try {
      print("test 2");
      final response = await _apiService.post('offers', offerData);
      final project = OffersModel.fromJson(response);
      print("repo $project");
      return Right(project);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, OffersModel>> updateOffer(
      int id, Map<String, dynamic> offerData) async {
    try {
      final response = await _apiService.patch('offers/$id', offerData);
      final offer = OffersModel.fromJson(response);
      return Right(offer);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(errMessage: e.toString()));
    }
  }
}
