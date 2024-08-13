// ignore_for_file: public_member_api_docs, sort_constructors_first
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

class ProfileCreateLoading extends ProfileState {}

class ClientProfileCreatedState extends ProfileState {
  final ClientProfile clientProfile;
  const ClientProfileCreatedState({
    required this.clientProfile,
  });
  @override
  List<Object> get props => [
        clientProfile,
      ];
}

class ProfileCreateError extends ProfileState {
  final String errorMessage;
  const ProfileCreateError({
    required this.errorMessage,
  });
  @override
  List<Object> get props => [
        errorMessage,
      ];
}

class EditProfileLoading extends ProfileState {}

class EditedClientProfileState extends ProfileState {
  final ClientProfile clientProfile;
  const EditedClientProfileState({
    required this.clientProfile,
  });
  @override
  List<Object> get props => [
        clientProfile,
      ];
}

class EditProfileError extends ProfileState {
  final String errorMessage;
  const EditProfileError({
    required this.errorMessage,
  });
  @override
  List<Object> get props => [
        errorMessage,
      ];
}

class AddPhotoToProfileLoading extends ProfileState {}

class AddedPhotoToProfile extends ProfileState {
  final String successMessage;

  const AddedPhotoToProfile(this.successMessage);

  @override
  List<Object> get props => [
        successMessage,
      ];
}

class AddPhotoToProfileError extends ProfileState {
  final String errorMessage;

  const AddPhotoToProfileError(this.errorMessage);
  @override
  List<Object> get props => [
        errorMessage,
      ];
}

class AddSkillToProfileLoading extends ProfileState {}

class AddedSkillToProfile extends ProfileState {
  final String successMessage;

  const AddedSkillToProfile(this.successMessage);

  @override
  List<Object> get props => [
        successMessage,
      ];
}

class AddSkillToProfileError extends ProfileState {
  final String errorMessage;

  const AddSkillToProfileError(this.errorMessage);
  @override
  List<Object> get props => [
        errorMessage,
      ];
}

class DeleteSkillToProfileLoading extends ProfileState {}

class DeleteSkillToProfileError extends ProfileState {
  final String errorMessage;

  const DeleteSkillToProfileError(this.errorMessage);
  @override
  List<Object> get props => [
        errorMessage,
      ];
}

class DeletePhotoToProfileLoading extends ProfileState {}

class DeletePhotoToProfileError extends ProfileState {
  final String errorMessage;

  const DeletePhotoToProfileError(this.errorMessage);
  @override
  List<Object> get props => [
        errorMessage,
      ];
}

class DeletedSkillToProfile extends ProfileState {
  final String successMessage;

  const DeletedSkillToProfile(this.successMessage);

  @override
  List<Object> get props => [
        successMessage,
      ];
}

class DeletedPhotoToProfile extends ProfileState {
  final String successMessage;

  const DeletedPhotoToProfile(this.successMessage);

  @override
  List<Object> get props => [
        successMessage,
      ];
}

class ClientProfileDeleted extends ProfileState {}

class DeleteClientProfileError extends ProfileState {
  final String errorMessage;

  const DeleteClientProfileError(this.errorMessage);
  @override
  List<Object> get props => [
        errorMessage,
      ];
}
