import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:onr_app/features/auth/domain/entities/auth_user.dart';
import 'package:onr_app/features/auth/domain/usecases/login_usecase.dart';
import 'package:dartz/dartz.dart';

import '../mocks/repositories_mock_helper.mocks.dart';

void main() {
  late LoginUseCase loginUseCase;
  late MockAuthRepository mockAuthRepository;

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    loginUseCase = LoginUseCase(mockAuthRepository);
  });

  const tEmail = 'test@example.com';
  const tPassword = 'password123';
  final tUser = AuthUser(id: '1', email: tEmail, password: tPassword);

  test('should return User when login is successful', () async {
    when(mockAuthRepository.login(any, any))
        .thenAnswer((_) async => Right(tUser));

    final result = await loginUseCase((tEmail, tPassword));

    expect(result, Right(tUser));
    verify(mockAuthRepository.login(tEmail, tPassword)).called(1);
    verifyNoMoreInteractions(mockAuthRepository);
  });

}
