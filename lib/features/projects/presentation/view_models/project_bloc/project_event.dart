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

<<<<<<< HEAD:lib/features/projects/presentation/view_models/project_bloc/project_event.dart
class DeleteProject extends ProjectEvent {
  final int projectId;

  const DeleteProject(this.projectId);

  @override
  List<Object> get props => [projectId];
=======
class FetchOffersByProject extends ProjectEvent {
  // حدث جديد لطلب العروض
  final int projectId;
  const FetchOffersByProject(this.projectId);
>>>>>>> c17aaecf2b0fcfb04115103d45cd839bcaa27f6f:lib/features/projects/presentation/view_models/bloc/project_event.dart
}
