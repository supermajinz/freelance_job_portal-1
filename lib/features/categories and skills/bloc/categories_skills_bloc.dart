import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freelance_job_portal/features/categories%20and%20skills/category_skill_repo.dart';
import 'package:freelance_job_portal/features/categories%20and%20skills/models/categories/category.dart';
import 'package:freelance_job_portal/features/categories%20and%20skills/models/job_title.dart';
import 'package:freelance_job_portal/features/categories%20and%20skills/models/skill.dart';

part 'categories_skills_event.dart';
part 'categories_skills_state.dart';

class CategoriesSkillsBloc
    extends Bloc<CategoriesSkillsEvent, CategoriesSkillsState> {
  // ignore: non_constant_identifier_names
  final CategorySkillRepo CSrepo;
  List<Category> _categories = [];
  List<JobTitle> _jobTitles = [];
  List<Skill> _skills = [];
  List<int> _selectedSkillIds = [];

  CategoriesSkillsBloc(this.CSrepo) : super(CategoriesSkillsInitial()) {
    on<GetCategoriesEvent>(_getCategories);
    on<GetSkillsEvent>(_getSkills);
    on<GetJobTitlesEvent>(_getJobTitles);
    on<CategorySelectedEvent>(_categorySelected);
    on<JobTitleSelectedEvent>(_onJobTitleSelected);
    on<SkillSelectedEvent>(_skillSelected);
  }

  FutureOr<void> _getCategories(
      GetCategoriesEvent event, Emitter<CategoriesSkillsState> emit) async {
    emit(CSLoading());
    final result = await CSrepo.getCategories();
    result.fold(
      (failure) => emit(CSError(failure.errMessage)),
      (categories) {
        _categories = categories;
        //print("cats in bloc ${_categories}");
        emit(CategoriesLoadedState(_categories));
      },
    );
  }

  FutureOr<void> _getSkills(
      GetSkillsEvent event, Emitter<CategoriesSkillsState> emit) async {
    emit(CSLoading());
    final result = await CSrepo.getSkills(event.categoryId);
    result.fold(
      (failure) => emit(CSError(failure.errMessage)),
      (skills) {
        _skills = skills;
        emit(SkillsLoadedState(_skills, _selectedSkillIds));
      },
    );
  }

  FutureOr<void> _getJobTitles(
      GetJobTitlesEvent event, Emitter<CategoriesSkillsState> emit) async {
    emit(CSLoading());
    final result = await CSrepo.getJobDesignations();
    result.fold(
      (failure) => emit(CSError(failure.errMessage)),
      (jobTitles) {
        _jobTitles = jobTitles;
        emit(JobTitlesLoadedState(_jobTitles));
      },
    );
  }

  FutureOr<void> _categorySelected(
      CategorySelectedEvent event, Emitter<CategoriesSkillsState> emit) async {
   // print("block ${event.categoryId}");
    final result = await CSrepo.getSkills(event.categoryId);
    result.fold((failure) => emit(CSError(failure.errMessage)), (skills) {
     // print(skills.toString());
      emit(CategorySelectedState(_categories, event.categoryId, skills));
    });

   // print('bloc: ${event.categoryId}');
  }

  FutureOr<void> _onJobTitleSelected(
      JobTitleSelectedEvent event, Emitter<CategoriesSkillsState> emit) {
    emit(JobTitleSelected(_jobTitles, event.jobTitleId));
  }

  FutureOr<void> _skillSelected(
      SkillSelectedEvent event, Emitter<CategoriesSkillsState> emit) {
    _selectedSkillIds.add(event.skillId);
  //  print("bloc selected skill ${event.skillId}");
    emit(SkillSelected(_skills, _selectedSkillIds));
  }
}
