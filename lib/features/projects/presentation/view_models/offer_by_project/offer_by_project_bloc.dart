import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../offers/data/model/offers_model/offers_model.dart';
import '../../../data/repo/project_repo.dart';
part 'offer_by_project_event.dart';
part 'offer_by_project_state.dart';

class OfferByProjectBloc
    extends Bloc<OfferByProjectEvent, OfferByProjectState> {
  final ProjectRepo repo;
  OfferByProjectBloc(this.repo) : super(OfferByProjectInitial()) {
    on<FetchOffersByProject>(_onFetchOffersByProject);
  }
  Future<void> _onFetchOffersByProject(
      FetchOffersByProject event, Emitter<OfferByProjectState> emit) async {
    emit(OfferByProjectLoading());
    final result = await repo.getOffersByProject(event.projectId);
    result.fold((failure) => emit(OfferByProjectFaliure(failure.errMessage)),
        (offers) => emit(OfferByProjectLoaded(offers)));
  }
}
