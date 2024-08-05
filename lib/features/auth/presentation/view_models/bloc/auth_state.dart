part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class AuthError extends AuthState {
  final String error;

  const AuthError({required this.error});

  @override
  List<Object> get props => [error];
}

final class AuthCodeSent extends AuthState {
  final String message;

  const AuthCodeSent({required this.message});

  @override
  List<Object> get props => [message];
}

final class AuthVerified extends AuthState {}

final class AuthAuthenticated extends AuthState {
  final int id;
  const AuthAuthenticated({required this.id});

  @override
  List<Object> get props => [id];
}

final class AuthInvalidCode extends AuthState {
  final String message;

  const AuthInvalidCode({required this.message});

  @override
  List<Object> get props => [message];
}

class AuthUnauthenticated extends AuthState {}

class AuthLoggedOut extends AuthState {}

class AuthGuest extends AuthState {}
