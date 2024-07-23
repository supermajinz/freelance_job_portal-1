// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class RegisterEvent extends AuthEvent {
  final User user;
  final String password;
  const RegisterEvent({
    required this.user,
    required this.password,
  });
  @override
  List<Object> get props => [user, password];
}

class LoginEvent extends AuthEvent {
  final String phone;
  final String password;
  const LoginEvent({
    required this.phone,
    required this.password,
  });
  @override
  List<Object> get props => [phone, password];
}

class VerifyEvent extends AuthEvent {
  final String code;
  const VerifyEvent({
    required this.code,
  });
  @override
  List<Object> get props => [code];
}

class CheckAuthStatusEvent extends AuthEvent {}

class LogoutEvent extends AuthEvent {}

class ContinueAsGuestEvent extends AuthEvent {}
