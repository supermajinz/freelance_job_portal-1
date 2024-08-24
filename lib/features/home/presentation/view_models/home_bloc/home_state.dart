part of 'home_bloc.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

final class HomeBlocInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<Categories> categories;
  final Map<int, List<Skills>> skillsByCategory;
  final List<ProjectModel> projectSugg;
  final List<ProjectModel> projectMost;


  const HomeLoaded({required this.projectSugg, required this.projectMost, required this.categories, required this.skillsByCategory});

  @override
  List<Object> get props => [categories, skillsByCategory];
}

class HomeSuccessMostCommon extends HomeState {
  final List<ProjectModel> project;

  const HomeSuccessMostCommon(this.project);
  @override
  List<Object> get props => [project];
}
class HomeSuccessSuggestion extends HomeState {
  final List<ProjectModel> project;

  const HomeSuccessSuggestion(this.project);
  @override
  List<Object> get props => [project];
}

class HomeFailure extends HomeState {
  final String errMessage;

  const HomeFailure(this.errMessage);
  @override
  List<Object> get props => [errMessage];
}
