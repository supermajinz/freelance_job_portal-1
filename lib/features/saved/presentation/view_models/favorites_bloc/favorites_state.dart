part of 'favorites_bloc.dart';

sealed class FavoritesState extends Equatable {
  const FavoritesState();

  @override
  List<Object> get props => [];
}

final class FavoritesInitial extends FavoritesState {}

class FavoritesLoading extends FavoritesState {}

class AddProjectToFavoriteSuccess extends FavoritesState {
  final int projectId;

  const AddProjectToFavoriteSuccess(this.projectId);

  @override
  List<Object> get props => [projectId];
}

class AddUserToFavoriteSuccess extends FavoritesState {
  final int favoriteUserId;

  const AddUserToFavoriteSuccess(this.favoriteUserId);
}

class DeleteProjectFromFavoriteSuccess extends FavoritesState {
  final int projectId;

  const DeleteProjectFromFavoriteSuccess(this.projectId);

  @override
  List<Object> get props => [projectId];
}

class DeleteUserFromFavoriteSuccess extends FavoritesState {
  final int favoriteUserId;

  const DeleteUserFromFavoriteSuccess(this.favoriteUserId);
}

class GetFavoriteSuccess extends FavoritesState {
  final List<ProjectModel> projects;
  final List<User> users;

  const GetFavoriteSuccess(this.projects, this.users);

  @override
  List<Object> get props => [users, projects];
}

class FavoritesFailure extends FavoritesState {
  final String errMessage;

  const FavoritesFailure(this.errMessage);

  @override
  List<Object> get props => [errMessage];
}
