part of 'review_bloc.dart';

sealed class ReviewEvent extends Equatable {
  const ReviewEvent();

  @override
  List<Object> get props => [];
}

class AddReview extends ReviewEvent {
  final int projectId;
  final Map<String, dynamic> reviewData;

  const AddReview(this.projectId, this.reviewData);
}

class GetReview extends ReviewEvent {
  final int profileId;
  final bool isClient;


  const GetReview(this.profileId, this.isClient);
}
