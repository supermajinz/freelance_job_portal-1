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

class GetFavoriteProjectSuccess extends FavoritesState {
  final List<ProjectModel> projects;

  const GetFavoriteProjectSuccess(this.projects);

  @override
  List<Object> get props => [projects];
}

class GetFavoriteUserSuccess extends FavoritesState {
  final List<User> users;

  const GetFavoriteUserSuccess(this.users);

  @override
  List<Object> get props => [users];
}

class FavoritesFailure extends FavoritesState {
  final String errMessage;

  const FavoritesFailure(this.errMessage);

  @override
  List<Object> get props => [errMessage];
}
