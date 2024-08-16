import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freelance_job_portal/features/review/data/repo/review_repo.dart';
import '../../../data/model/rate_model/profile_rates.dart';
import '../../../data/model/review_model.dart';
part 'review_event.dart';
part 'review_state.dart';

class ReviewBloc extends Bloc<ReviewEvent, ReviewState> {
  final ReviewRepo repo;
  ReviewBloc(this.repo) : super(ReviewInitial()) {
    on<AddReview>(_onAddReview);
    on<GetReview>(_onGetReview);
  }
  Future<void> _onAddReview(AddReview event, Emitter<ReviewState> emit) async {
    print(event);
    print(event.projectId);
    emit(ReviewLoading());
    final result = await repo.addRate(event.projectId, event.reviewData);
    result.fold(
      (failure) => emit(ReviewFaliure(failure.errMessage)),
      (review) => emit(ReviewSuccess(review)),
    );
  }

  Future<void> _onGetReview(GetReview event, Emitter<ReviewState> emit) async {
    emit(ReviewLoading());
    final result = await repo.getProfileRate(event.profileId, event.isClient);
    result.fold(
      (failure) => emit(ReviewFaliure(failure.errMessage)),
      (review) => emit(GetReviewSuccess(review)),
    );
  }
}
