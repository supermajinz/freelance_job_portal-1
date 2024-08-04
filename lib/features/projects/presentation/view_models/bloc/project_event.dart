part of 'project_bloc.dart';

sealed class ProjectEvent extends Equatable {
  const ProjectEvent();

  @override
  List<Object> get props => [];
}

class FetchProjectDetails extends ProjectEvent {
  final int projectId;
  const FetchProjectDetails(this.projectId);
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

class FetchOffersByProject extends ProjectEvent {
  // حدث جديد لطلب العروض
  final int projectId;
  const FetchOffersByProject(this.projectId);
}
