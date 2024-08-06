part of 'my_project_bloc.dart';

sealed class MyProjectState extends Equatable {
  const MyProjectState();
  
  @override
  List<Object> get props => [];
}

final class MyProjectInitial extends MyProjectState {}
final class MyProjectLoading extends MyProjectState {}
final class MyProjectSuccess extends MyProjectState {}
final class MyProjectFaliure extends MyProjectState {}

