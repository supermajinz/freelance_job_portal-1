import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelance_job_portal/features/auth/presentation/view_models/bloc/auth_bloc.dart';
import 'package:freelance_job_portal/features/saved/presentation/view_models/favorites_bloc/favorites_bloc.dart';

class BookmarkButton extends StatelessWidget {
  const BookmarkButton({super.key, required this.isProject, required this.id});
  final bool isProject;
  final int id;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FavoritesBloc, FavoritesState>(
      buildWhen: (previous, current) => current is GetFavoriteSuccess,
      listenWhen: (previous, current) => isProject
          ? (current is AddProjectToFavoriteSuccess ||
              current is DeleteProjectFromFavoriteSuccess)
          : (current is AddUserToFavoriteSuccess ||
              current is DeleteUserFromFavoriteSuccess),
      listener: (context, state) {
        if (context.read<AuthBloc>().state is! AuthAuthenticated) return;
        final userId = (context.read<AuthBloc>().state as AuthAuthenticated).id;
        if (isProject &&
            state is AddProjectToFavoriteSuccess &&
            state.projectId == id) {
          context.read<FavoritesBloc>().add(GetFavorite(userId));
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('تم حفظ المشروع'),
            ),
          );
        } else if (isProject &&
            state is DeleteProjectFromFavoriteSuccess &&
            state.projectId == id) {
          context.read<FavoritesBloc>().add(GetFavorite(userId));
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('تم إلغاء حفظ المشروع'),
            ),
          );
        } else if (!isProject &&
            state is AddUserToFavoriteSuccess &&
            state.favoriteUserId == id) {
          context.read<FavoritesBloc>().add(GetFavorite(userId));
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('تم حفظ المستخدم'),
            ),
          );
        } else if (!isProject &&
            state is DeleteUserFromFavoriteSuccess &&
            state.favoriteUserId == id) {
          context.read<FavoritesBloc>().add(GetFavorite(userId));
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('تم الغاء حفظ المستخدم')),
          );
        }
      },
      builder: (context, state) {
        final isBookmarked = state is GetFavoriteSuccess
            ? isProject
                ? state.projects.any((element) => element.id == id)
                : state.users.any((element) => element.id == id)
            : false;
        return IconButton(
          icon: Icon(
            isBookmarked ? Icons.bookmark_added : Icons.bookmark_add_outlined,
          ),
          onPressed: () {
            
        if (context.read<AuthBloc>().state is! AuthAuthenticated) return;
        final userId = (context.read<AuthBloc>().state as AuthAuthenticated).id;
            if (isBookmarked) {
              context.read<FavoritesBloc>().add(isProject
                  ? DeleteProjectFromFavorite(userId, id)
                  : DeleteUserFromFavorite(userId, id));
            } else {
              context.read<FavoritesBloc>().add(isProject
                  ? AddProjectToFavorite(userId, id)
                  : AddUserToFavorite(userId, id));
            }
          },
        );
      },
    );
  }
}
