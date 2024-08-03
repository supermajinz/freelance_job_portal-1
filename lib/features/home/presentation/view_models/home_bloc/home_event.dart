part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class FetchCategories extends HomeEvent {}

class FetchSkillsByCategoryEvent extends HomeEvent {
  final int categoryId;
  const FetchSkillsByCategoryEvent(this.categoryId);

  @override
  List<Object> get props => [categoryId];
}

class FetchProjectMostCommon extends HomeEvent {}

class FetchProjectSuggestion extends HomeEvent {}
