part of 'worker_profile_bloc.dart';

sealed class WorkerProfileState extends Equatable {
  const WorkerProfileState();

  @override
  List<Object> get props => [];
}

final class WorkerProfileInitial extends WorkerProfileState {}

class WorkerProfileLoading extends WorkerProfileState {}

class WorkerProfileGetSuccess extends WorkerProfileState {
  final WorkerProfile myProfile;

  const WorkerProfileGetSuccess({required this.myProfile});

  @override
  List<Object> get props => [
        myProfile,
      ];
}

class WorkerProfileGetError extends WorkerProfileState {
  final String errorMessage;

  const WorkerProfileGetError({required this.errorMessage});
  @override
  List<Object> get props => [
        errorMessage,
      ];
}

class WorkerProfileNoProfiles extends WorkerProfileState {}

class WorkerProfilesLoaded extends WorkerProfileState {
  final List<WorkerProfile> profiles;

  const WorkerProfilesLoaded(this.profiles);
}

class WorkerProfileCreateLoading extends WorkerProfileState {}

class WorkerProfileCreatedState extends WorkerProfileState {
  final WorkerProfile workerProfile;
  const WorkerProfileCreatedState({
    required this.workerProfile,
  });
  @override
  List<Object> get props => [
        workerProfile,
      ];
}

class WorkerProfileCreateError extends WorkerProfileState {
  final String errorMessage;
  const WorkerProfileCreateError({
    required this.errorMessage,
  });
  @override
  List<Object> get props => [
        errorMessage,
      ];
}

class WorkerProfileEditLoading extends WorkerProfileState {}

class WorkerProfileEditedState extends WorkerProfileState {
  final WorkerProfile workerProfile;
  const WorkerProfileEditedState({
    required this.workerProfile,
  });
  @override
  List<Object> get props => [
        workerProfile,
      ];
}

class WorkerProfileEditError extends WorkerProfileState {
  final String errorMessage;
  const WorkerProfileEditError({
    required this.errorMessage,
  });
  @override
  List<Object> get props => [
        errorMessage,
      ];
}

class WorkerProfileAddPhotoLoading extends WorkerProfileState {}

class WorkerProfileAddedPhoto extends WorkerProfileState {
  final String successMessage;

  const WorkerProfileAddedPhoto(this.successMessage);

  @override
  List<Object> get props => [
        successMessage,
      ];
}

class WorkerProfileAddPhotoError extends WorkerProfileState {
  final String errorMessage;

  const WorkerProfileAddPhotoError(this.errorMessage);
  @override
  List<Object> get props => [
        errorMessage,
      ];
}

class WorkerProfileAddSkillLoading extends WorkerProfileState {}

class WorkerProfileAddedSkill extends WorkerProfileState {
  final String successMessage;

  const WorkerProfileAddedSkill(this.successMessage);

  @override
  List<Object> get props => [
        successMessage,
      ];
}

class WorkerProfileAddSkillError extends WorkerProfileState {
  final String errorMessage;

  const WorkerProfileAddSkillError(this.errorMessage);
  @override
  List<Object> get props => [
        errorMessage,
      ];
}

class WorkerProfileDeleteSkillLoading extends WorkerProfileState {}

class WorkerProfileDeleteSkillError extends WorkerProfileState {
  final String errorMessage;

  const WorkerProfileDeleteSkillError(this.errorMessage);
  @override
  List<Object> get props => [
        errorMessage,
      ];
}

class WorkerProfileDeletePhotoLoading extends WorkerProfileState {}

class WorkerProfileDeletePhotoError extends WorkerProfileState {
  final String errorMessage;

  const WorkerProfileDeletePhotoError(this.errorMessage);
  @override
  List<Object> get props => [
        errorMessage,
      ];
}

class WorkerProfileDeletedSkill extends WorkerProfileState {
  final String successMessage;

  const WorkerProfileDeletedSkill(this.successMessage);

  @override
  List<Object> get props => [
        successMessage,
      ];
}

class WorkerProfileDeletedPhoto extends WorkerProfileState {
  final String successMessage;

  const WorkerProfileDeletedPhoto(this.successMessage);

  @override
  List<Object> get props => [
        successMessage,
      ];
}

class WorkerProfileDeleted extends WorkerProfileState {}

class WorkerProfileDeleteError extends WorkerProfileState {
  final String errorMessage;

  const WorkerProfileDeleteError(this.errorMessage);
  @override
  List<Object> get props => [
        errorMessage,
      ];
}
