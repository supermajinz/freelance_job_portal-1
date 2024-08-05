part of 'offer_by_project_bloc.dart';

sealed class OfferByProjectEvent extends Equatable {
  const OfferByProjectEvent();

  @override
  List<Object> get props => [];
}

class FetchOffersByProject extends OfferByProjectEvent {
  final int projectId;
  const FetchOffersByProject(this.projectId);
}
