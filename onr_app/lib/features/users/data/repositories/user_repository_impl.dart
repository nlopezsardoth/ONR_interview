import 'package:dartz/dartz.dart';
import 'package:onr_app/features/shared/data/datasources/remote_datasource.dart';
import 'package:onr_app/features/shared/data/datasources/remote_datasource_impl.dart';
import 'package:onr_app/features/shared/utils/typedefs.dart';
import 'package:onr_app/features/users/data/mappers/user_model_mapper.dart';
import 'package:onr_app/features/users/domain/entities/user.dart';
import 'package:onr_app/features/users/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final RemoteDataSource _remoteDataSource;

  UserRepositoryImpl({RemoteDataSource? remoteDataSource})
      : _remoteDataSource = remoteDataSource ?? RemoteDataSourceImpl();

  @override
  ResultFuture<List<User>> getUsers() async {
    final response = await _remoteDataSource.getUsers();
    if (response.isSuccess) {
      return Right(UserModelMapper.toEntityList(response.data!));
    }
    return Left(response.failure!);
  }
}
