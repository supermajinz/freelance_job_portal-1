import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freelance_job_portal/features/profile/data/models/profile/worker_Profile/worker_profile.dart';
import 'package:freelance_job_portal/features/profile/data/profile_repo.dart';
import 'package:freelance_job_portal/features/profile/worker%20profile/worker_profile_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'worker_profile_event.dart';
part 'worker_profile_state.dart';

class WorkerProfileBloc extends Bloc<WorkerProfileEvent, WorkerProfileState> {
  final WorkerProfileRepoImpl _profileRepo;
  final SharedPreferences _sharedPreferences;
  static const String _currentProfileKey = 'currentWorkerProfileId';

  WorkerProfileBloc(this._profileRepo, this._sharedPreferences)
      : super(WorkerProfileInitial()) {
    on<ShowWorkerProfile>(showWorkerProfile);
    on<GetWorkerProfiles>(getWorkerProfiles);
    on<CreateWorkerProfileEvent>(createWorkerProfile);
    on<AddPhotoToWorkerProfileEvent>(addPhotoToWorkerProfile);
    on<AddSkillToWorkerProfileEvent>(addSkillToWorkerProfile);
    on<EditWorkerProfileEvent>(editWorkerProfile);
    on<DeletePhotoToWorkerProfileEvent>(deletePhotoToWorkerProfile);
    on<DeleteSkillToWorkerProfileEvent>(deleteSkillToWorkerProfile);
    on<DeleteWorkerProfileEvent>(_deleteWorkerProfile);
    on<ChangeCurrentProfileEvent>(_changeCurrentProfile);
  }

  FutureOr<void> showWorkerProfile(
      ShowWorkerProfile event, Emitter<WorkerProfileState> emit) async {
    emit(WorkerProfileLoading());
    final result = await _profileRepo.getProfile(event.userId, event.profileId);
    result.fold(
        (failure) =>
            emit(WorkerProfileGetError(errorMessage: failure.errMessage)),
        (profile) {
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
        (profiles) async {
      if (profiles.isEmpty) {
        emit(WorkerProfileNoProfiles());
      } else {
        final int? currentProfileId =
            _sharedPreferences.getInt(_currentProfileKey);
        if (currentProfileId != null) {
          final int index =
              profiles.indexWhere((profile) => profile.id == currentProfileId);
          if (index != -1) {
            emit(WorkerProfilesLoaded(profiles,
                currentProfile: profiles[index]));
          } else {
            // Handle the case where the stored profile ID is not found
            // You might want to clear the stored ID or show an error message
            _sharedPreferences.remove(_currentProfileKey);
            emit(WorkerProfilesLoaded(profiles,
                currentProfile: profiles[0])); // Default to the first profile
          }
        } else {
          _sharedPreferences.setInt(_currentProfileKey,
              profiles[0].id!); // Store the first profile's ID
          emit(WorkerProfilesLoaded(profiles,
              currentProfile: profiles[0])); // Default to the first profile
        }
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
      (workerProfile) async {
        add(ChangeCurrentProfileEvent(workerProfile.id!));
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
    result
        .fold((failure) => emit(WorkerProfileAddPhotoError(failure.errMessage)),
            (success) {
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
    result
        .fold((failure) => emit(WorkerProfileAddSkillError(failure.errMessage)),
            (success) {
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
        (failure) => emit(WorkerProfileDeletePhotoError(failure.errMessage)),
        (success) {
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

  FutureOr<void> _changeCurrentProfile(
      ChangeCurrentProfileEvent event, Emitter<WorkerProfileState> emit) async {
    final currentState = state;
    if (currentState is WorkerProfilesLoaded) {
      final int index = currentState.profiles
          .indexWhere((profile) => profile.id == event.profileId);
      if (index != -1) {
        _sharedPreferences.setInt(_currentProfileKey, event.profileId);
        emit(WorkerProfilesLoaded(currentState.profiles,
            currentProfile: currentState.profiles[index]));
      }
    }
  }
}
