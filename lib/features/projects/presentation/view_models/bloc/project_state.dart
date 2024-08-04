part of 'project_bloc.dart';

sealed class ProjectState extends Equatable {
  const ProjectState();

  @override
  List<Object> get props => [];
}

class ProjectInitial extends ProjectState {}

class ProjectLoading extends ProjectState {}
class CreateProjectLoading extends ProjectState {}

class CreateProjectSuccess extends ProjectState {
  final ProjectModel project;

  const CreateProjectSuccess({required this.project});

  @override
  List<Object> get props => [project];
}

class EditProjectSuccess extends ProjectState {
  final EditProjectModel project;

  const EditProjectSuccess({required this.project});

  @override
  List<Object> get props => [project];
}


class ProjectLoaded extends ProjectState {
  final ProjectModel project;
  const ProjectLoaded(this.project);
  @override
  List<Object> get props => [project];
}

class OffersLoaded extends ProjectState { // حالة جديدة للعروض
  final List<OffersModel> offers;
  const OffersLoaded(this.offers);
  @override
  List<Object> get props => [offers];
}

class ProjectError extends ProjectState {
  final String message;
  const ProjectError(this.message);
  @override
  List<Object> get props => [message];
}
