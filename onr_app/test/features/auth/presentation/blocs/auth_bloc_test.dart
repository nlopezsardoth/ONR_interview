import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:onr_app/features/auth/domain/entities/auth_user.dart';
import 'package:onr_app/features/auth/presentation/blocs/auth/auth_bloc.dart';
import 'package:onr_app/features/shared/data/errors/failures.dart';

import '../../domain/mocks/usecases_mock_helper.mocks.dart';

void main() {
  late AuthBloc authBloc;
  late MockLoginUseCase mockLoginUseCase;
  late MockLogoutUseCase mockLogoutUseCase;

  setUp(() {
    mockLoginUseCase = MockLoginUseCase();
    mockLogoutUseCase = MockLogoutUseCase();
    authBloc = AuthBloc(
      loginUseCase: mockLoginUseCase,
      logoutUseCase: mockLogoutUseCase,
    );
  });

  tearDown(() => authBloc.close());

  const email = 'test@example.com';
  const password = 'password123';
  const testUser = AuthUser(id: "1", password: password, email: email);

  group('AuthBloc', () {
    blocTest<AuthBloc, AuthState>(
      'emits [AuthLoading, Authenticated] when login is successful',
      build: () {
        when(mockLoginUseCase.call((email, password)))
            .thenAnswer((_) async => Right(testUser));
        return authBloc;
      },
      act: (bloc) => bloc.add(const Login(testUser)),
      expect: () => [
        const AuthState.authenticated(testUser),
      ],
      verify: (_) {
        verify(mockLoginUseCase.call((email, password))).called(1);
      },
    );

    blocTest<AuthBloc, AuthState>(
      'emits [AuthLoading, Unauthenticated] and triggers error when login fails',
      build: () {
        when(mockLoginUseCase.call((email, password)))
            .thenAnswer((_) async => Left(LocalAuthFailure(message: 'Login failed')));
        return authBloc;
      },
      act: (bloc) => bloc.add(const Login(testUser)),
      expect: () => [
        const AuthState.unauthenticated(),
      ],
      verify: (_) {
        verify(mockLoginUseCase.call((email, password))).called(1);
      },
    );

    blocTest<AuthBloc, AuthState>(
      'emits [AuthLoading, Unauthenticated] when logout is successful',
      build: () {
        when(mockLogoutUseCase.call(unit))
            .thenAnswer((_) async => const Right(unit));
        return authBloc;
      },
      act: (bloc) => bloc.add(Logout()),
      expect: () => [
        const AuthState.unauthenticated(),
      ],
      verify: (_) {
        verify(mockLogoutUseCase.call(unit)).called(1);
      },
    );

    blocTest<AuthBloc, AuthState>(
      'triggers error when logout fails',
      build: () {
        when(mockLogoutUseCase.call(unit))
            .thenAnswer((_) async => Left(LocalAuthFailure(message: 'Logout failed')));
        return authBloc;
      },
      act: (bloc) => bloc.add(Logout()),
      expect: () => [],
      verify: (_) {
        verify(mockLogoutUseCase.call(unit)).called(1);
      },
    );
  });
}
