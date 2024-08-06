part of 'my_project_bloc.dart';

sealed class MyProjectState extends Equatable {
  const MyProjectState();

  @override
  List<Object> get props => [];
}

final class MyProjectInitial extends MyProjectState {}

final class MyProjectLoading extends MyProjectState {}

final class MyProjectSuccess extends MyProjectState {
  final List<ProjectModel> projects;
  const MyProjectSuccess(this.projects);
  @override
  List<Object> get props => [projects];
}

final class MyProjectFaliure extends MyProjectState {
  final String message;
  const MyProjectFaliure(this.message);
  @override
  List<Object> get props => [message];
}
