import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freelance_job_portal/core/errors/failures.dart';
import 'package:freelance_job_portal/features/auth/data/auth_repo.dart';
import 'package:freelance_job_portal/features/auth/data/models/user.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepo _authRepo;
  AuthBloc(this._authRepo) : super(AuthInitial()) {
    on<RegisterEvent>(registerEvent);
    on<LoginEvent>(loginEvent);
    on<VerifyEvent>(verifyEvent);
    on<CheckAuthStatusEvent>(checkAuthStatus);
    on<LogoutEvent>(logoutEvent);
    on<ContinueAsGuestEvent>(continueAsGuestEvent);
  }

  FutureOr<void> registerEvent(
      RegisterEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final result = await _authRepo.register(event.user, event.password);
    result.fold(
      (failure) => emit(AuthError(error: failure.errMessage)),
      (message) => (emit(AuthCodeSent(message: message))),
    );
  }

  FutureOr<void> loginEvent(LoginEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final result = await _authRepo.login(event.phone, event.password);
    result.fold(
      (failure) => (emit(AuthError(error: failure.errMessage))),
      (message) => emit(AuthCodeSent(message: message)),
    );
  }

  FutureOr<void> verifyEvent(VerifyEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final result = await _authRepo.verify(event.code);
    result.fold(
      (failure) {
        if (failure is ServerFailure && failure.statusCode == 400) {
          emit(AuthInvalidCode(message: failure.errMessage));
        } else {
          emit(AuthError(error: failure.errMessage));
        }
      },
      (tokens) {
        emit(AuthVerified());
        add(CheckAuthStatusEvent());
      },
    );
  }

  Future<void> checkAuthStatus(
      CheckAuthStatusEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final result = await _authRepo.getUserId();
    result.fold((failure) => emit(AuthUnauthenticated()),
        (userId) => emit(AuthAuthenticated(id: userId)));
  }

  FutureOr<void> logoutEvent(LogoutEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final result = await _authRepo.logout();
    result.fold((failure) => emit(AuthError(error: failure.errMessage)), (t) {
      emit(
        AuthLoggedOut(),
      );
    });
  }

  FutureOr<void> continueAsGuestEvent(
      ContinueAsGuestEvent event, Emitter<AuthState> emit) {
    emit(AuthGuest());
  }
}
