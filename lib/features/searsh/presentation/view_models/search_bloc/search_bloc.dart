import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../projects/data/model/project_model/project_model.dart';
import '../../../data/repo/search_repo_.dart';
part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchRepo searchRepo;

  SearchBloc(this.searchRepo) : super(SearchInitial()) {
    on<SearchProjectsEvent>((event, emit) async {
      emit(SearchLoading());
      final result = await searchRepo.searchProjects(
        params: event.filters
      );

      result.fold(
        (failure) => emit(SearchFailure(errMessage: failure.errMessage)),
        (projects) => emit(SearchSuccess(projects)),
      );
    });
  }
}
