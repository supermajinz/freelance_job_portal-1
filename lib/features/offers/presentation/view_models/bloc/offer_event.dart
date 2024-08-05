part of 'offer_bloc.dart';

sealed class OfferEvent extends Equatable {
  const OfferEvent();

  @override
  List<Object> get props => [];
}

class CreateOffer extends OfferEvent {
  final Map<String, dynamic> offerData;

  const CreateOffer(this.offerData);

  @override
  List<Object> get props => [offerData];
}

class UpdateOffer extends OfferEvent {
  final int offerId;
  final Map<String, dynamic> offerData;

  const UpdateOffer(this.offerId, this.offerData);

  @override
  List<Object> get props => [offerId, offerData];
}
