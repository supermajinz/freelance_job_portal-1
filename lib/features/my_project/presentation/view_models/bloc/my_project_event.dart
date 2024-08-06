part of 'my_project_bloc.dart';

sealed class MyProjectEvent extends Equatable {
  const MyProjectEvent();

  @override
  List<Object> get props => [];
}

class FetchMyProject extends MyProjectEvent {
  final int userId;
  const FetchMyProject(this.userId);
}
