import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../../core/errors/failures.dart';
import '../../../data/model/create_project_model.dart';
import '../../../data/model/edit_project_model.dart';
import '../../../data/model/project_model/project_model.dart';
import '../../../data/repo/project_repo.dart';
part 'project_event.dart';
part 'project_state.dart';

class ProjectBloc extends Bloc<ProjectEvent, ProjectState> {
  final ProjectRepo repo;
  ProjectBloc(this.repo) : super(ProjectInitial()) {
    on<FetchProjectDetails>(_onFetchProjectDetails);
    on<CreateProjectSubmitted>(_onCreateProjectSubmitted);
    on<UpdateProject>(_onUpdateProject);
    on<DeleteProject>(_onDeleteProject);
  }

  Future<void> _onFetchProjectDetails(
      FetchProjectDetails event, Emitter<ProjectState> emit) async {
    emit(ProjectLoading());
    final result = await repo.getProjectDetails(event.projectId);
    emit(_eitherLoadedOrErrorState(result));
  }

  ProjectState _eitherLoadedOrErrorState(Either<Failure, ProjectModel> result) {
    return result.fold((failure) => ProjectError(failure.errMessage),
        (project) => ProjectLoaded(project));
  }

  Future<void> _onCreateProjectSubmitted(
    CreateProjectSubmitted event,
    Emitter<ProjectState> emit,
  ) async {
    emit(CreateProjectLoading());
    final result = await repo.createProject(event.project);
    result.fold(
      (failure) => emit(ProjectError(failure.errMessage)),
      (project) => emit(CreateProjectSuccess(project: project)),
    );
  }

  Future<void> _onUpdateProject(
    UpdateProject event,
    Emitter<ProjectState> emit,
  ) async {
    emit(ProjectLoading());
    final result = await repo.updateProject(event.project, event.projectId);
    result.fold(
      (failure) => emit(ProjectError(failure.errMessage)),
      (project) => emit(EditProjectSuccess(project: project)),
    );
  }

  Future<void> _onDeleteProject(
      DeleteProject event, Emitter<ProjectState> emit) async {
    final result = await repo.deleteProject(event.projectId);
    result.fold(
      (failure) => emit(ProjectError(failure.errMessage)),
      
      (_) => emit(ProjectDelet()),
    );
  }
}
