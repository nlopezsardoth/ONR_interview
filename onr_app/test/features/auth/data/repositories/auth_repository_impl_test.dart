import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:onr_app/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:onr_app/features/auth/domain/entities/user.dart';
import 'package:onr_app/features/shared/data/errors/failures.dart';
import 'package:onr_app/features/shared/utils/api_response_handler.dart';
import 'package:dartz/dartz.dart';


import '../mocks/datasource_mock_helper.mocks.dart';

void main() {
  late AuthRepositoryImpl repository;
  late MockAuthLocalDataSource mockLocalDataSource;

  setUp(() {
    mockLocalDataSource = MockAuthLocalDataSource();
    repository = AuthRepositoryImpl(localDataSource:  mockLocalDataSource);
  });

  group('AuthRepositoryImpl', () {
    const email = 'test@example.com';
    const password = 'password123';

    group('login', () {
      test('should return true when login is successful', () async {
        when(mockLocalDataSource.login(email, password))
            .thenAnswer((_) async => ApiResponse.success(true));

        final result = await repository.login(email, password);

        expect(result, isA<Right<Failure, User>>());
        verify(mockLocalDataSource.login(email, password));
        verifyNoMoreInteractions(mockLocalDataSource);
      });

      test('should return Failure when login fails', () async {
        final failure = ServerFailure(message: 'Login failed', statusCode: 500);
        when(mockLocalDataSource.login(email, password))
            .thenAnswer((_) async => ApiResponse.error(failure: failure));

        final result = await repository.login(email, password);

        expect(result, isA<Left<Failure, User>>());
        verify(mockLocalDataSource.login(email, password));
        verifyNoMoreInteractions(mockLocalDataSource);
      });
    });

    group('logout', () {
      test('should return true when logout is successful', () async {
        when(mockLocalDataSource.logout())
            .thenAnswer((_) async => ApiResponse.success(true));

        final result = await repository.logout();

        expect(result, isA<Right<Failure, Unit>>());
        verify(mockLocalDataSource.logout());
        verifyNoMoreInteractions(mockLocalDataSource);
      });

      test('should return Failure when logout fails', () async {
        final failure = ServerFailure(message: 'Logout failed', statusCode: 500);
        when(mockLocalDataSource.logout())
            .thenAnswer((_) async => ApiResponse.error(failure: failure));

        final result = await repository.logout();

        expect(result, isA<Left<Failure, Unit>>());
        verify(mockLocalDataSource.logout());
        verifyNoMoreInteractions(mockLocalDataSource);
      });
    });
  });
}