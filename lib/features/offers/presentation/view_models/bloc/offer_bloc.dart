import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freelance_job_portal/features/offers/data/repo/offer_repo.dart';
import '../../../data/model/offers_model/offers_model.dart';

part 'offer_event.dart';
part 'offer_state.dart';

class OfferBloc extends Bloc<OfferEvent, OfferState> {
  final OfferRepo repo;
  OfferBloc(this.repo) : super(OfferInitial()) {
    on<CreateOffer>(_onCreateOffer);
    on<UpdateOffer>(_onUpdateOffer);
    on<DeleteOffer>(_onDeleteOffer);
  }

  Future<void> _onCreateOffer(
    CreateOffer event,
    Emitter<OfferState> emit,
  ) async {
    emit(OfferLoading());
    final result = await repo.createOffer(event.offerData);
    result.fold(
      (failure) => emit(OfferFaliure(failure.errMessage)),
      (offer) => emit(OfferSuccess(offer)),
    );
  }

  Future<void> _onUpdateOffer(
    UpdateOffer event,
    Emitter<OfferState> emit,
  ) async {
    emit(OfferLoading());
    final result = await repo.updateOffer(event.offerId, event.offerData);
    result.fold(
      (failure) => emit(OfferFaliure(failure.errMessage)),
      (offer) => emit(OfferSuccess(offer)),
    );
  }

  Future<void> _onDeleteOffer(
      DeleteOffer event, Emitter<OfferState> emit) async {
    final result = await repo.deleteOffer(event.offerId);
    result.fold(
      (failure) => emit(OfferFaliure(failure.errMessage)),
      (_) => emit(OfferDeleteSuccess()),
    );
  }
}
