part of 'categories_skills_bloc.dart';

sealed class CategoriesSkillsState extends Equatable {
  const CategoriesSkillsState();

  @override
  List<Object> get props => [];
}

final class CategoriesSkillsInitial extends CategoriesSkillsState {}

class CSLoading extends CategoriesSkillsState {}

class CSError extends CategoriesSkillsState {
  final String err;

  const CSError(this.err);
}

class CategoriesLoadedState extends CategoriesSkillsState {
  final List<Category> categories;
  const CategoriesLoadedState(this.categories);
}

class SkillsLoadedState extends CategoriesSkillsState {
  final List<Skill> skills;
  final List<int> selectedSkillIds;

  const SkillsLoadedState(this.skills, this.selectedSkillIds);
}

class JobTitlesLoadedState extends CategoriesSkillsState {
  final List<JobTitle> jobTitles;

  const JobTitlesLoadedState(this.jobTitles);
}

class CategorySelectedState extends CategoriesSkillsState {
  final List<Category> categories;
  final int selectedCategoryId;
  final List<Skill> skills;

  const CategorySelectedState(
      this.categories, this.selectedCategoryId, this.skills);

  @override
  List<Object> get props => [categories, selectedCategoryId];
}

class JobTitleSelected extends CategoriesSkillsState {
  final List<JobTitle> jobTitles;
  final int selectedJobTitleId;

  const JobTitleSelected(
    this.jobTitles,
    this.selectedJobTitleId,
  );

  @override
  List<Object> get props => [selectedJobTitleId, jobTitles];
}

class SkillSelected extends CategoriesSkillsState {
  final List<Skill> skills;
  final List<int> selectedSkills;

  const SkillSelected(this.skills, this.selectedSkills);

  @override
  List<Object> get props => [skills, selectedSkills];
}
