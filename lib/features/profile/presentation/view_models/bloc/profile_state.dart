part of 'profile_bloc.dart';

sealed class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

final class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileGetSuccess extends ProfileState {
  final ClientProfile myProfile;

  const ProfileGetSuccess({required this.myProfile});

  @override
  List<Object> get props => [
        myProfile,
      ];
}

class ProfileGetError extends ProfileState {
  final String errorMessage;

  const ProfileGetError({required this.errorMessage});
  @override
  List<Object> get props => [
        errorMessage,
      ];
}

class ProfileNoProfiles extends ProfileState {}

class ProfilesLoaded extends ProfileState {
 final List<ClientProfile> profiles;

  const ProfilesLoaded(this.profiles);
}
