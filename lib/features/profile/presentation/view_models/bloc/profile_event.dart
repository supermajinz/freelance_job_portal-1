part of 'profile_bloc.dart';

sealed class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

class ShowProfile extends ProfileEvent {
  final int userId;
  final int profileId;

  const ShowProfile({required this.userId, required this.profileId});
}

class GetProfiles extends ProfileEvent {
  final int userId;

  const GetProfiles(this.userId);
}
