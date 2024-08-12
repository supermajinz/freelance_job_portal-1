part of 'review_bloc.dart';

sealed class ReviewState extends Equatable {
  const ReviewState();

  @override
  List<Object> get props => [];
}

final class ReviewInitial extends ReviewState {}

final class ReviewLoading extends ReviewState {}

final class ReviewSuccess extends ReviewState {
  final ReviewModel review;

  const ReviewSuccess(this.review);
}

final class GetReviewSuccess extends ReviewState {
  final ProfileRates profileRates;

  const GetReviewSuccess(this.profileRates);

  @override
  List<Object> get props => [profileRates];
}

final class ReviewFaliure extends ReviewState {
  final String errMessage;

  const ReviewFaliure(this.errMessage);
}
