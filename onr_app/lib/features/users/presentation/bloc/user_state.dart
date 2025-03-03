part of 'user_bloc.dart';

enum UserStatus { loading, success, failure }

class UserState extends Equatable {
  final UserStatus status;
  final List<User>? users;

  const UserState({
    this.status = UserStatus.loading,
    this.users = const [],
  });

  UserState copyWith({
    UserStatus? status,
    List<User>? users,
  }) {
    return UserState(
      status: status ?? this.status,
      users: users ?? this.users,
    );
  }

  @override
  List<Object?> get props => [status, users];
}