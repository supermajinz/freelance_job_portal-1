import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freelance_job_portal/features/home/data/repo/home_repo.dart';
import '../../../../projects/data/model/project_model/project_model.dart';
import '../../../data/model/caregories/caregories.dart';
import '../../../data/model/skills/skills.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepo homeRepo;
  HomeBloc(this.homeRepo) : super(HomeBlocInitial()) {
    on<FetchCategories>(_fetchCategories);
    on<FetchSkillsByCategoryEvent>(_fetchSkills);
    on<FetchProjectMostCommon>(_fetchProjectMostCommon);
    on<FetchProjectSuggestion>(_fetchProjectSuggestion);
  }
  Future<void> _fetchCategories(
    FetchCategories event,
    Emitter<HomeState> emit,
  ) async {
    emit(HomeLoading());
    final results = await homeRepo.fetchCategories();
    await results.fold(
      (failure) async => emit(HomeFailure(failure.errMessage)),
      (categories) async {
        Map<int, List<Skills>> skillsByCategory = {};
        for (var category in categories) {
          final skillsResult =
              await homeRepo.fetchSkillsByCategory(category.id!);
          skillsResult.fold(
            (failure) => emit(HomeFailure(failure.errMessage)),
            (skills) => skillsByCategory[category.id!] = skills,
          );
        }
        emit(HomeLoaded(
            categories: categories, skillsByCategory: skillsByCategory));
      },
    );
  }

  Future<void> _fetchSkills(
    FetchSkillsByCategoryEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(HomeLoading());
    final results = await homeRepo.fetchSkillsByCategory(event.categoryId);
    results.fold(
      (failure) => emit(HomeFailure(failure.errMessage)),
      (skills) {
        if (state is HomeLoaded) {
          final loadedState = state as HomeLoaded;
          final updatedSkillsByCategory =
              Map<int, List<Skills>>.from(loadedState.skillsByCategory)
                ..[event.categoryId] = skills;
          emit(HomeLoaded(
              categories: loadedState.categories,
              skillsByCategory: updatedSkillsByCategory));
        }
      },
    );
  }

  Future<void> _fetchProjectMostCommon(
    FetchProjectMostCommon event,
    Emitter<HomeState> emit,
  ) async {
    emit(HomeLoading());
    final resuls = await homeRepo.fetchProjectMostCommon();
    resuls.fold((faliure) => emit(HomeFailure(faliure.errMessage)),
        (project) => emit(HomeSuccess(project)));
  }

  Future<void> _fetchProjectSuggestion(
    FetchProjectSuggestion event,
    Emitter<HomeState> emit,
  ) async {
    emit(HomeLoading());
    final resuls = await homeRepo.fetchProjectSuggestion();
    resuls.fold((faliure) => emit(HomeFailure(faliure.errMessage)),
        (project) => emit(HomeSuccess(project)));
  }
}
