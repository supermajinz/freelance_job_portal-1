// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'categories_skills_bloc.dart';

sealed class CategoriesSkillsEvent extends Equatable {
  const CategoriesSkillsEvent();

  @override
  List<Object> get props => [];
}

class GetCategoriesEvent extends CategoriesSkillsEvent {}

class GetSkillsEvent extends CategoriesSkillsEvent {
  final int categoryId;

  const GetSkillsEvent(this.categoryId);
}

class GetJobTitlesEvent extends CategoriesSkillsEvent {}

class CategorySelectedEvent extends CategoriesSkillsEvent {
  final int categoryId;

  const CategorySelectedEvent(this.categoryId);
}

class JobTitleSelectedEvent extends CategoriesSkillsEvent {
  final int jobTitleId;

  const JobTitleSelectedEvent(this.jobTitleId);

  @override
  List<Object> get props => [jobTitleId];
}

class SkillSelectedEvent extends CategoriesSkillsEvent {
  final int skillId;

  SkillSelectedEvent(this.skillId);

  @override
  List<Object> get props => [skillId];
}
