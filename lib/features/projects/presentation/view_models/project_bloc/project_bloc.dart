import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../../core/errors/failures.dart';
import '../../../../offers/data/model/offers_model/offers_model.dart';
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
<<<<<<< HEAD:lib/features/projects/presentation/view_models/project_bloc/project_bloc.dart
    on<DeleteProject>(_onDeleteProject);
=======
    on<FetchOffersByProject>(_onFetchOffersByProject); // إضافة الحدث الجديد
>>>>>>> c17aaecf2b0fcfb04115103d45cd839bcaa27f6f:lib/features/projects/presentation/view_models/bloc/project_bloc.dart
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

<<<<<<< HEAD:lib/features/projects/presentation/view_models/project_bloc/project_bloc.dart
  Future<void> _onDeleteProject(
      DeleteProject event, Emitter<ProjectState> emit) async {
    final result = await repo.deleteProject(event.projectId);
    result.fold(
      (failure) => emit(ProjectError(failure.errMessage)),
      
      (_) => emit(ProjectDelet()),
    );
=======
  Future<void> _onFetchOffersByProject(
      FetchOffersByProject event, Emitter<ProjectState> emit) async {
    // تنفيذ الحدث الجديد
    emit(ProjectLoading());
    final result = await repo.getOffersByProject(event.projectId);
    result.fold((failure) => emit(ProjectError(failure.errMessage)),
        (offers) => emit(OffersLoaded(offers)));
>>>>>>> c17aaecf2b0fcfb04115103d45cd839bcaa27f6f:lib/features/projects/presentation/view_models/bloc/project_bloc.dart
  }
}
