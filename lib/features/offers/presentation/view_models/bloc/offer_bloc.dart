import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freelance_job_portal/features/offers/data/repo/offer_repo.dart';
import '../../../data/model/offers_model/offers_model.dart';

part 'offer_event.dart';
part 'offer_state.dart';

class OfferBloc extends Bloc<OfferEvent, OfferState> {
  final OffersRepo repo;
  OfferBloc(this.repo) : super(OfferInitial()) {
    on<CreateOffer>(_onCreateOffer);
  }

  Future<void> _onCreateOffer(
    CreateOffer event,
    Emitter<OfferState> emit,
  ) async {
    emit(OfferLoading());
    final result = await repo.createOffer(event.offerData);
    result.fold(
      (failure) => emit(OfferFaliure(failure.errMessage)),
      (offer) {
        emit(OfferSuccess(offer));
      },
    );
  }
}
