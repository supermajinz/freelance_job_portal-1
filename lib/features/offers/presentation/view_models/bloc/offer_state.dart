part of 'offer_bloc.dart';

sealed class OfferState extends Equatable {
  const OfferState();

  @override
  List<Object> get props => [];
}

final class OfferInitial extends OfferState {}

final class OfferLoading extends OfferState {}

final class OfferSuccess extends OfferState {
  final OffersModel offer;

  const OfferSuccess(this.offer);

  @override
  List<Object> get props => [offer];
}

final class OfferFaliure extends OfferState {
  final String errMessage;

  const OfferFaliure(this.errMessage);
  @override
  List<Object> get props => [errMessage];
}
