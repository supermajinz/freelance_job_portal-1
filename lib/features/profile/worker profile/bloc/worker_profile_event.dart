part of 'worker_profile_bloc.dart';


sealed class WorkerProfileEvent extends Equatable {
  const WorkerProfileEvent();

  @override
  List<Object> get props => [];
}

class ShowWorkerProfile extends WorkerProfileEvent {
  final int userId;
  final int profileId;

  const ShowWorkerProfile({required this.userId, required this.profileId});
}

class GetWorkerProfiles extends WorkerProfileEvent {
  final int userId;

  const GetWorkerProfiles(this.userId);
}

class CreateWorkerProfileEvent extends WorkerProfileEvent {
  final String description;
  final int jobTitleId;
  final int categoryId;

  const CreateWorkerProfileEvent(
      {required this.description,
      required this.jobTitleId,
      required this.categoryId});
  @override
  List<Object> get props => [description, jobTitleId, categoryId];
}

class EditWorkerProfileEvent extends WorkerProfileEvent {
  final String description;
  final int jobTitleId;
  final int categoryId;
  final int profileId;

  const EditWorkerProfileEvent(this.profileId,
      {required this.description,
      required this.jobTitleId,
      required this.categoryId});
  @override
  List<Object> get props => [description, jobTitleId, categoryId];
}

class AddPhotoToWorkerProfileEvent extends WorkerProfileEvent {
  final int workerProfileId;
  final int photoId;

  const AddPhotoToWorkerProfileEvent(this.workerProfileId, this.photoId);
}

class AddSkillToWorkerProfileEvent extends WorkerProfileEvent {
  final int workerProfileId;
  final int skillId;

  const AddSkillToWorkerProfileEvent(this.workerProfileId, this.skillId);
}

class DeletePhotoToWorkerProfileEvent extends WorkerProfileEvent {
  final int workerProfileId;
  final int photoId;

  const DeletePhotoToWorkerProfileEvent(this.workerProfileId, this.photoId);
}

class DeleteSkillToWorkerProfileEvent extends WorkerProfileEvent {
  final int workerProfileId;
  final int skillId;

  const DeleteSkillToWorkerProfileEvent(this.workerProfileId, this.skillId);
}

class DeleteWorkerProfileEvent extends WorkerProfileEvent {
  final int profileId;

  const DeleteWorkerProfileEvent(this.profileId);
}
