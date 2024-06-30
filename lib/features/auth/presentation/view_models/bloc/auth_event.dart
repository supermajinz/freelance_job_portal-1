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
  
}

class LoginEvent extends AuthEvent {}

class VerifyEvent extends AuthEvent {}
