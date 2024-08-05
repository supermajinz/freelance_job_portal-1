import 'package:dartz/dartz.dart';
import 'package:freelance_job_portal/core/errors/failures.dart';
import '../model/offers_model/offers_model.dart';

abstract class OfferRepo {
  Future<Either<Failure, OffersModel>> createOffer(
      Map<String, dynamic> offerData);
  Future<Either<Failure, OffersModel>> updateOffer(
      int id, Map<String, dynamic> offerData);
  Future<Either<Failure, Unit>> deleteOffer(int offerId);
}
