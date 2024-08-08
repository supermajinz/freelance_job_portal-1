import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../data/model/create_project_model.dart';
import '../../../data/model/edit_project_model.dart';
import '../../../data/model/project_model/project_model.dart';
import '../../../data/repo/project_repo.dart';
part 'project_event.dart';
part 'project_state.dart';

class ProjectBloc extends Bloc<ProjectEvent, ProjectState> {
  final ProjectRepo repo;
  ProjectBloc(this.repo) : super(ProjectInitial()) {
    on<CreateProjectSubmitted>(_onCreateProjectSubmitted);
    on<UpdateProject>(_onUpdateProject);
    on<DeleteProject>(_onDeleteProject);
    on<CloseProject>(_onCloseProject);
    on<AcceptOffer>(_onAcceptOffer); // إضافة المعالجة لقبول العرض
    on<RejectOffer>(_onRejectOffer); // إضافة المعالجة لرفض العرض
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
      (project) {
        emit(EditProjectSuccess(project: project));
      },
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

  Future<void> _onCloseProject(
      CloseProject event, Emitter<ProjectState> emit) async {
    emit(ProjectLoading());
    final result = await repo.closeProject(event.projectId);
    result.fold(
      (failure) => emit(ProjectError(failure.errMessage)),
      (_) => emit(ProjectClose()),
    );
  }

  Future<void> _onAcceptOffer(
      AcceptOffer event, Emitter<ProjectState> emit) async {
    emit(ProjectLoading());
    final result = await repo.acceptOffer(event.offerId);
    result.fold(
      (failure) => emit(ProjectError(failure.errMessage)),
      (_) => emit(OfferAccept()),
    );
  }

  Future<void> _onRejectOffer(
      RejectOffer event, Emitter<ProjectState> emit) async {
    emit(ProjectLoading());
    final result = await repo.rejectOffer(event.offerId);
    result.fold(
      (failure) => emit(ProjectError(failure.errMessage)),
      (_) => emit(OfferReject()),
    );
  }
}
