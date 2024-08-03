import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:freelance_job_portal/core/errors/failures.dart';
import 'package:freelance_job_portal/core/utils/api_service.dart';
import 'package:freelance_job_portal/features/offers/data/model/offer_model/offer_model.dart';
import 'package:freelance_job_portal/features/offers/data/repo/offer_repo.dart';

class OfferRepoImpl implements OfferRepo {
  final ApiService _apiService;

  OfferRepoImpl(this._apiService);

  @override
  Future<Either<Failure, OfferModel>> createOffer(
      Map<String, dynamic> offerData) async {
    try {
      final response = await _apiService.post('offers', offerData);
      final project = OfferModel.fromJson(response);
      return Right(project);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }
  
@override
  Future<Either<Failure, OfferModel>> updateOffer(int id, Map<String, dynamic> offerData) async {
    try {
      final response = await _apiService.put('offers/$id', offerData);
      final offer = OfferModel.fromJson(response);
      return Right(offer);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }


}
  // @override
  // Future<Either<Failure, OfferModel>> fetchOfferDetails(int id) async {
  //   try {
  //     final response = await _apiService.get('offers/$id');
  //     final offer = OfferModel.fromJson(response);
  //     return Right(offer);
  //   } catch (e) {
  //     if (e is DioException) {
  //       return left(ServerFailure.fromDioException(e));
  //     }
  //     return left(ServerFailure(errMessage: e.toString()));
  //   }
  // }





