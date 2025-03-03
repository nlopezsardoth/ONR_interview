import 'package:dartz/dartz.dart';
import 'package:onr_app/features/shared/utils/typedefs.dart';
import 'package:onr_app/features/auth/domain/entities/auth_user.dart';

abstract class AuthRepository {
  /// Attempts to log in with the provided email and password.
  /// Returns a [User] entity on success or a [Failure] on error.
  ResultFuture<AuthUser> login(String email, String password);

  /// Logs out the currently authenticated user.
  /// Returns [Unit] on success or a [Failure] on error.
  ResultFuture<Unit> logout();
}