import 'package:dartz/dartz.dart';
import 'package:freelance_job_portal/core/errors/failures.dart';
import 'package:freelance_job_portal/features/offers/data/model/offer_model/offer_model.dart';
import '../model/offers_model/offers_model.dart';

abstract class OfferRepo {
  Future<Either<Failure, OffersModel>> createOffer(
      Map<String, dynamic> offerData);
  Future<Either<Failure, OffersModel>> updateOffer(
      int id, Map<String, dynamic> offerData);
}
