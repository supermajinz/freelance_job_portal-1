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

class CreateClientProfileEvent extends ProfileEvent {
  final String description;
  final int jobTitleId;

  const CreateClientProfileEvent(
      {required this.description, required this.jobTitleId});
  @override
  List<Object> get props => [description, jobTitleId];
}

class EditClientProfileEvent extends ProfileEvent {
  final String description;
  final int jobTitleId;
  final int profileId;

  const EditClientProfileEvent(this.profileId,
      {required this.description, required this.jobTitleId});
  @override
  List<Object> get props => [description, jobTitleId];
}

class AddPhotoToClientProfileEvent extends ProfileEvent {
  final int clientProfileId;
  final int photoId;

  const AddPhotoToClientProfileEvent(this.clientProfileId, this.photoId);
}

class AddSkillToClientProfileEvent extends ProfileEvent {
  final int clientProfileId;
  final int skillId;

  const AddSkillToClientProfileEvent(this.clientProfileId, this.skillId);
}

class DeletePhotoToClientProfileEvent extends ProfileEvent {
  final int clientProfileId;
  final int photoId;

  const DeletePhotoToClientProfileEvent(this.clientProfileId, this.photoId);
}

class DeleteSkillToClientProfileEvent extends ProfileEvent {
  final int clientProfileId;
  final int skillId;

  const DeleteSkillToClientProfileEvent(this.clientProfileId, this.skillId);
}

class DeleteClientProfileEvent extends ProfileEvent {
  final int profileId;

  const DeleteClientProfileEvent(this.profileId);
}

class ChangeCurrentProfileEvent extends ProfileEvent {
  final int profileId;
  const ChangeCurrentProfileEvent(this.profileId);
  @override
  List<Object> get props => [
        profileId,
      ];
}
