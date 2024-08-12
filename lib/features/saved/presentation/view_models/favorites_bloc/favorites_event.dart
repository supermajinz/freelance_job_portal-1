part of 'favorites_bloc.dart';

sealed class FavoritesEvent extends Equatable {
  const FavoritesEvent();

  @override
  List<Object> get props => [];
}

class AddProjectToFavorite extends FavoritesEvent {
  final int userId;
  final int projectId;

  const AddProjectToFavorite(this.userId, this.projectId);

  @override
  List<Object> get props => [userId, projectId];
}

class AddUserToFavorite extends FavoritesEvent {
  final int userId;
  final int favoriteUserId;

  const AddUserToFavorite(this.userId, this.favoriteUserId);

  @override
  List<Object> get props => [userId, favoriteUserId];
}

class DeleteProjectFromFavorite extends FavoritesEvent {
  final int userId;
  final int projectId;

  const DeleteProjectFromFavorite(this.userId, this.projectId);

  @override
  List<Object> get props => [userId, projectId];
}

class DeleteUserFromFavorite extends FavoritesEvent {
  final int userId;
  final int favoriteUserId;

  const DeleteUserFromFavorite(this.userId, this.favoriteUserId);

  @override
  List<Object> get props => [userId, favoriteUserId];
}

class GetFavoriteProject extends FavoritesEvent {
  final int userId;

  const GetFavoriteProject(this.userId);

  @override
  List<Object> get props => [userId];
}

class GetFavoriteUser extends FavoritesEvent {
  final int userId;

  const GetFavoriteUser(this.userId);

  @override
  List<Object> get props => [userId];
}
