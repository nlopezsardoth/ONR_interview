part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

class Login extends AuthEvent {
  final User user;

  const Login(this.user);

  @override
  List<Object> get props => [user];
}

class Logout extends AuthEvent {}

class CheckStatus extends AuthEvent {}
