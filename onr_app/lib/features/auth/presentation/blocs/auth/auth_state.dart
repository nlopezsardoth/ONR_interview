part of 'auth_bloc.dart';

enum AuthStatus { unknown, authenticated, unauthenticated }

class AuthState extends Equatable {
  const AuthState({
    this.status = AuthStatus.unknown,
    this.user = AuthUser.empty,
  });

  const AuthState.unknown() : this();

  const AuthState.authenticated(AuthUser user)
      : this(status: AuthStatus.authenticated, user: user);

  const AuthState.unauthenticated() : this(status: AuthStatus.unauthenticated);

  final AuthStatus status;
  final AuthUser user;

  @override
  List<Object> get props => [status, user];
}
