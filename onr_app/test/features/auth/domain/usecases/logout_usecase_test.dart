import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:onr_app/features/auth/domain/usecases/logout_usecase.dart';
import 'package:dartz/dartz.dart';

import '../mocks/repositories_mock_helper.mocks.dart';



void main() {
  late LogoutUseCase logoutUseCase;
  late MockAuthRepository mockAuthRepository;

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    logoutUseCase = LogoutUseCase(mockAuthRepository);
  });

  test('should return Unit when logout is successful', () async {
    when(mockAuthRepository.logout()).thenAnswer((_) async => const Right(unit));

    final result = await logoutUseCase(unit);

    expect(result, const Right(unit));
    verify(mockAuthRepository.logout()).called(1);
    verifyNoMoreInteractions(mockAuthRepository);
  });
}
