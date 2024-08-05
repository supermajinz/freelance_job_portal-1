part of 'offer_by_project_bloc.dart';

sealed class OfferByProjectState extends Equatable {
  const OfferByProjectState();

  @override
  List<Object> get props => [];
}

final class OfferByProjectInitial extends OfferByProjectState {}

class OfferByProjectLoading extends OfferByProjectState {}

class OfferByProjectLoaded extends OfferByProjectState {
  final List<OffersModel> offers;
  const OfferByProjectLoaded(this.offers);
  @override
  List<Object> get props => [offers];
}

class OfferByProjectFaliure extends OfferByProjectState {
  final String message;
  const OfferByProjectFaliure(this.message);
  @override
  List<Object> get props => [message];
}
