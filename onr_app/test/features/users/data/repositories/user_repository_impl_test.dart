import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:onr_app/features/shared/data/errors/failures.dart';
import 'package:onr_app/features/shared/utils/api_response_handler.dart';
import 'package:onr_app/features/users/data/models/user_model.dart';
import 'package:onr_app/features/users/data/repositories/user_repository_impl.dart';
import 'package:onr_app/features/users/domain/entities/user.dart';
import '../../../products/data/mocks/datasource_mock_helper.mocks.dart';

void main() {
  late UserRepositoryImpl repository;
  late MockRemoteDataSource mockRemoteDataSource;

  setUp(() {
    mockRemoteDataSource = MockRemoteDataSource();
    repository = UserRepositoryImpl(remoteDataSource: mockRemoteDataSource);
  });

  group('getUsers', () {
    final tUsersJson = [
      {
        "id": 1,
        "email": "test@example.com",
        "username": "testuser",
        "password": "password",
        "name": {"firstname": "John", "lastname": "Doe"},
        "address": {
          "city": "City",
          "street": "Street",
          "number": 123,
          "zipcode": "12345",
          "geolocation": {"lat": "0.0000", "long": "0.0000"}
        },
        "phone": "123-456-7890"
      }
    ];

    final tUserModels =
        tUsersJson.map((json) => UserModel.fromJson(json)).toList();

    test(
        'Debe retornar una lista de User cuando RemoteDataSource.getUsers() es exitoso',
        () async {
      when(mockRemoteDataSource.getUsers()).thenAnswer(
        (_) async => ApiResponse.success(tUserModels),
      );

      final result = await repository.getUsers();

      expect(result, isA<Right<Failure, List<User>>>());
      verify(mockRemoteDataSource.getUsers()).called(1);
      verifyNoMoreInteractions(mockRemoteDataSource);
    });

    test('Debe retornar Failure cuando RemoteDataSource.getUsers() falla',
        () async {
      final failure = ServerFailure(message: "Error", statusCode: 500);
      when(mockRemoteDataSource.getUsers())
          .thenAnswer((_) async => ApiResponse.error(failure: failure));

      final result = await repository.getUsers();

      expect(result, Left(failure));
      verify(mockRemoteDataSource.getUsers()).called(1);
      verifyNoMoreInteractions(mockRemoteDataSource);
    });
  });
}
