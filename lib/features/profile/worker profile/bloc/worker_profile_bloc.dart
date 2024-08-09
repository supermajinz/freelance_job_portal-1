import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freelance_job_portal/features/profile/data/models/profile/worker_Profile/worker_profile.dart';
import 'package:freelance_job_portal/features/profile/data/profile_repo.dart';
import 'package:freelance_job_portal/features/profile/worker%20profile/worker_profile_repo.dart';

part 'worker_profile_event.dart';
part 'worker_profile_state.dart';


class WorkerProfileBloc extends Bloc<WorkerProfileEvent, WorkerProfileState> {
  final WorkerProfileRepoImpl _profileRepo;
  WorkerProfileBloc(
    this._profileRepo,
  ) : super(WorkerProfileInitial()) {
    on<ShowWorkerProfile>(showWorkerProfile);
    on<GetWorkerProfiles>(getWorkerProfiles);
    on<CreateWorkerProfileEvent>(createWorkerProfile);
    on<AddPhotoToWorkerProfileEvent>(addPhotoToWorkerProfile);
    on<AddSkillToWorkerProfileEvent>(addSkillToWorkerProfile);
    on<EditWorkerProfileEvent>(editWorkerProfile);
    on<DeletePhotoToWorkerProfileEvent>(deletePhotoToWorkerProfile);
    on<DeleteSkillToWorkerProfileEvent>(deleteSkillToWorkerProfile);
    on<DeleteWorkerProfileEvent>(_deleteWorkerProfile);
  }

  FutureOr<void> showWorkerProfile(
      ShowWorkerProfile event, Emitter<WorkerProfileState> emit) async {
    emit(WorkerProfileLoading());
    final result = await _profileRepo.getProfile(event.userId, event.profileId);
    result.fold(
        (failure) =>
            emit(WorkerProfileGetError(errorMessage: failure.errMessage)),
        (profile) {
      //print('we are in bloc');
      print(profile.toString());
      emit(WorkerProfileGetSuccess(myProfile: profile));
    });
  }

  FutureOr<void> getWorkerProfiles(
      GetWorkerProfiles event, Emitter<WorkerProfileState> emit) async {
    emit(WorkerProfileLoading());
    final result = await _profileRepo.getUserProfiles(event.userId);
    result.fold(
        (failure) =>
            emit(WorkerProfileGetError(errorMessage: failure.errMessage)),
        (profiles) {
      if (profiles.isEmpty) {
        emit(WorkerProfileNoProfiles());
      } else {
        emit(WorkerProfilesLoaded(profiles));
      }
    });
  }

  FutureOr<void> createWorkerProfile(
      CreateWorkerProfileEvent event, Emitter<WorkerProfileState> emit) async {
    emit(WorkerProfileCreateLoading());
    final result = await _profileRepo.createProfile({
      "bio": event.description,
      "jobTitleId": event.jobTitleId,
      "categoryId": event.categoryId,
    });
    result.fold(
      (failure) =>
          emit(WorkerProfileCreateError(errorMessage: failure.errMessage)),
      (workerProfile) {
        print(workerProfile.toString());
        emit(WorkerProfileCreatedState(workerProfile: workerProfile));
      },
    );
  }

  FutureOr<void> addPhotoToWorkerProfile(AddPhotoToWorkerProfileEvent event,
      Emitter<WorkerProfileState> emit) async {
    emit(WorkerProfileAddPhotoLoading());
    final result = await _profileRepo.addPhoto({
      "workerProfileId": event.workerProfileId,
      "photoId": event.photoId,
    });
    result.fold(
        (failure) =>
            emit(WorkerProfileAddPhotoError(failure.errMessage)),
        (success) {
      print(
          'added photo workerProfileId: ${event.workerProfileId} photoId:  ${event.photoId}');
      emit(WorkerProfileAddedPhoto(success));
    });
  }

  FutureOr<void> addSkillToWorkerProfile(AddSkillToWorkerProfileEvent event,
      Emitter<WorkerProfileState> emit) async {
    emit(WorkerProfileAddSkillLoading());
    final result = await _profileRepo.addSkill({
      "workerProfileId": event.workerProfileId,
      "skillId": event.skillId,
    });
    result.fold(
        (failure) =>
            emit(WorkerProfileAddSkillError(failure.errMessage)),
        (success) {
      print(
          'added skill workerProfileId: ${event.workerProfileId} skillId:  ${event.skillId}');

      emit(WorkerProfileAddedSkill(success));
    });
  }

  FutureOr<void> editWorkerProfile(
      EditWorkerProfileEvent event, Emitter<WorkerProfileState> emit) async {
    emit(WorkerProfileEditLoading());
    final result = await _profileRepo.editProfile({
      "bio": event.description,
      "jobTitleId": event.jobTitleId,
      "categoryId": event.categoryId,
    }, event.profileId);
    result.fold(
      (failure) =>
          emit(WorkerProfileEditError(errorMessage: failure.errMessage)),
      (workerProfile) {
        print(workerProfile.toString());
        emit(WorkerProfileEditedState(workerProfile: workerProfile));
      },
    );
  }

  FutureOr<void> deletePhotoToWorkerProfile(
      DeletePhotoToWorkerProfileEvent event,
      Emitter<WorkerProfileState> emit) async {
    emit(WorkerProfileDeletePhotoLoading());
    final result = await _profileRepo.deletePhoto({
      "workerProfileId": event.workerProfileId,
      "photoId": event.photoId,
    });
    result.fold(
        (failure) => emit(
            WorkerProfileDeletePhotoError(failure.errMessage)),
        (success) {
      print(
          'deleted photo workerProfileId: ${event.workerProfileId} skillId:  ${event.photoId}');

      emit(WorkerProfileDeletedPhoto(success));
    });
  }

  FutureOr<void> deleteSkillToWorkerProfile(
      DeleteSkillToWorkerProfileEvent event,
      Emitter<WorkerProfileState> emit) async {
    emit(WorkerProfileDeleteSkillLoading());
    final result = await _profileRepo.deleteSkill({
      "workerProfileId": event.workerProfileId,
      "skillId": event.skillId,
    });
    result.fold(
        (failure) => emit(
            WorkerProfileDeleteSkillError(failure.errMessage)),
        (success) {
      print(
          'deleted skill workerProfileId: ${event.workerProfileId} skillId:  ${event.skillId}');

      emit(WorkerProfileDeletedSkill(success));
    });
  }

  FutureOr<void> _deleteWorkerProfile(
      DeleteWorkerProfileEvent event, Emitter<WorkerProfileState> emit) async {
    emit(WorkerProfileLoading());
    final result = await _profileRepo.deleteProfile(event.profileId);
    result.fold(
        (failure) =>
            emit(WorkerProfileDeleteError(failure.errMessage)),
        (_) {
      emit(WorkerProfileDeleted());
    });
  }
}
