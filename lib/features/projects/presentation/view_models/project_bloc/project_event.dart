part of 'project_bloc.dart';

sealed class ProjectEvent extends Equatable {
  const ProjectEvent();

  @override
  List<Object> get props => [];
}

class CreateProjectSubmitted extends ProjectEvent {
  final CreateProjectModel project;

  const CreateProjectSubmitted({required this.project});

  @override
  List<Object> get props => [project];
}

class UpdateProject extends ProjectEvent {
  final int projectId;
  final EditProjectModel project;

  const UpdateProject(this.projectId, this.project);
  @override
  List<Object> get props => [projectId, project];
}

class DeleteProject extends ProjectEvent {
  final int projectId;

  const DeleteProject(this.projectId);

  @override
  List<Object> get props => [projectId];
}

class CloseProject extends ProjectEvent {
  final int projectId;

  const CloseProject(this.projectId);

  @override
  List<Object> get props => [projectId];
}

class AcceptOffer extends ProjectEvent {
  final int offerId;

  const AcceptOffer(this.offerId);

  @override
  List<Object> get props => [offerId];
}

class RejectOffer extends ProjectEvent {
  final int offerId;

  const RejectOffer(this.offerId);

  @override
  List<Object> get props => [offerId];
}

class CompleteProject extends ProjectEvent {
  final int projectId;

  const CompleteProject(this.projectId);

  @override
  List<Object> get props => [projectId];
}

class SubmitProject extends ProjectEvent {
  final int projectId;

  const SubmitProject(this.projectId);

  @override
  List<Object> get props => [projectId];
}
