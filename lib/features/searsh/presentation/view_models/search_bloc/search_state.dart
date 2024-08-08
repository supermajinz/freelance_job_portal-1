part of 'search_bloc.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchSuccess extends SearchState {
  final List<ProjectModel> projects;

  const SearchSuccess( this.projects);

  @override
  List<Object> get props => [projects];
}

class SearchFailure extends SearchState {
  final String errMessage;

  const SearchFailure({required this.errMessage});

  @override
  List<Object> get props => [errMessage];
}
