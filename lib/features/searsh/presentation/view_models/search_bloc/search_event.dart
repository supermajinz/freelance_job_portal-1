part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object?> get props => [];
}

class SearchProjectsEvent extends SearchEvent {
  final Map<String, dynamic> filters;

  const SearchProjectsEvent({required this.filters});

  @override
  List<Object?> get props => [
        filters,
      ];
}
