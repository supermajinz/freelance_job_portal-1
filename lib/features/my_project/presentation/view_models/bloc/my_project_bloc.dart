import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freelance_job_portal/features/my_project/data/repo/my_project_repo.dart';
import '../../../../projects/data/model/project_model/project_model.dart';
part 'my_project_event.dart';
part 'my_project_state.dart';

class MyProjectBloc extends Bloc<MyProjectEvent, MyProjectState> {
  final MyProjectRepo repo;
  MyProjectBloc(this.repo) : super(MyProjectInitial()) {
    on<FetchMyProject>(_onFetchMyProject);
  }
  Future<void> _onFetchMyProject(
      FetchMyProject event, Emitter<MyProjectState> emit) async {
    emit(MyProjectLoading());
    final result = await repo.getMyProject(event.userId);
    result.fold((failure) => emit(MyProjectFaliure(failure.errMessage)),
        (projects) => emit(MyProjectSuccess(projects)));
  }
}
