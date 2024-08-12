import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freelance_job_portal/features/projects/data/model/project_model/project_model.dart';
import 'package:freelance_job_portal/features/saved/data/repo/favorite_repo.dart';
import '../../../../auth/data/models/user.dart';
part 'favorites_event.dart';
part 'favorites_state.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  final FavoriteRepo repo;

  FavoritesBloc(this.repo) : super(FavoritesInitial()) {
    on<AddProjectToFavorite>(_onAddProjectToFavorite);
    on<AddUserToFavorite>(_onAddUserToFavorite);
    on<DeleteProjectFromFavorite>(_onDeleteProjectFromFavorite);
    on<DeleteUserFromFavorite>(_onDeleteUserFromFavorite);
    on<GetFavoriteProject>(_onGetFavoriteProject);
    on<GetFavoriteUser>(_onGetFavoriteUser);
  }

  Future<void> _onAddProjectToFavorite(
      AddProjectToFavorite event, Emitter<FavoritesState> emit) async {
    emit(FavoritesLoading());
    final result =
        await repo.addProjectToFavorite(event.userId, event.projectId);
    result.fold(
      (failure) => emit(FavoritesFailure(failure.errMessage)),
      (_) => emit(AddProjectToFavoriteSuccess(event.projectId)),
    );
  }

  Future<void> _onAddUserToFavorite(
      AddUserToFavorite event, Emitter<FavoritesState> emit) async {
    emit(FavoritesLoading());
    final result =
        await repo.addUserToFavorite(event.userId, event.favoriteUserId);
    result.fold(
      (failure) => emit(FavoritesFailure(failure.errMessage)),
      (_) => emit(AddUserToFavoriteSuccess(event.favoriteUserId)),
    );
  }

  Future<void> _onDeleteProjectFromFavorite(
      DeleteProjectFromFavorite event, Emitter<FavoritesState> emit) async {
    emit(FavoritesLoading());
    final result =
        await repo.deleteProjectFromFavorite(event.userId, event.projectId);
    result.fold(
      (failure) => emit(FavoritesFailure(failure.errMessage)),
      (_) => emit(DeleteProjectFromFavoriteSuccess(event.projectId)),
    );
  }

  Future<void> _onDeleteUserFromFavorite(
      DeleteUserFromFavorite event, Emitter<FavoritesState> emit) async {
    emit(FavoritesLoading());
    final result =
        await repo.deleteUserFromFavorite(event.userId, event.favoriteUserId);
    result.fold(
      (failure) => emit(FavoritesFailure(failure.errMessage)),
      (_) => emit(DeleteUserFromFavoriteSuccess(event.favoriteUserId)),
    );
  }

  Future<void> _onGetFavoriteProject(
      GetFavoriteProject event, Emitter<FavoritesState> emit) async {
    emit(FavoritesLoading());
    final result = await repo.getFavoriteProject(event.userId);
    result.fold(
      (failure) => emit(FavoritesFailure(failure.errMessage)),
      (projects) => emit(GetFavoriteProjectSuccess(projects)),
    );
  }

  Future<void> _onGetFavoriteUser(
      GetFavoriteUser event, Emitter<FavoritesState> emit) async {
    emit(FavoritesLoading());
    final result = await repo.getFavoriteUser(event.userId);
    result.fold(
      (failure) => emit(FavoritesFailure(failure.errMessage)),
      (users) => emit(GetFavoriteUserSuccess(users)),
    );
  }
}
