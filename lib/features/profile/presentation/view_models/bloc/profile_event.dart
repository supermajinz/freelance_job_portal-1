part of 'profile_bloc.dart';

sealed class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

class ShowProfile extends ProfileEvent {
  final int id;

  const ShowProfile({required this.id});
}
