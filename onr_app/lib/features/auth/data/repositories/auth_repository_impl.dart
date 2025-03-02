import 'package:onr_app/features/auth/data/datasources/auth_local_datasource_impl.dart';
import 'package:onr_app/features/shared/utils/typedefs.dart';
import 'package:onr_app/features/auth/data/datasources/auth_local_datasource.dart';
import 'package:onr_app/features/auth/domain/entities/user.dart';
import 'package:onr_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:onr_app/features/shared/data/errors/failures.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthLocalDataSource _localDataSource;

  AuthRepositoryImpl({
    AuthLocalDataSource? localDataSource,
  }) : _localDataSource = localDataSource ?? AuthLocalDataSourceImpl();

  @override
  ResultFuture<User> login(String email, String password) async {
    try {
      final response = await _localDataSource.login(email, password);
      if (response.isSuccess) {
        return Right(User(id: '1', email: email, password: password));
      } else {
        return Left(LocalAuthFailure(message: 'Login failed'));
      }
    } catch (e) {
      return Left(LocalAuthFailure(message: e.toString()));
    }
  }

  @override
  ResultFuture<Unit> logout() async {
    try {
      final response = await _localDataSource.logout();
      if (response.isSuccess) {
        return const Right(unit);
      } else {
        return Left(LocalAuthFailure(message: 'Logout failed'));
      }
    } catch (e) {
      return Left(LocalAuthFailure(message: e.toString()));
    }
  }
}
