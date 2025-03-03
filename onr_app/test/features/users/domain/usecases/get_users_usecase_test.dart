import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:onr_app/features/users/domain/entities/user.dart';
import 'package:onr_app/features/users/domain/usecases/get_users_usecase.dart';

import '../mocks/repositories_mock_helper.mocks.dart';

void main() {
  late GetUsersUseCase useCase;
  late MockUserRepository mockUserRepository;

  setUp(() {
    mockUserRepository = MockUserRepository();
    useCase = GetUsersUseCase(mockUserRepository);
  });
  final tUsers = [
      User(
        id: 1,
        email: "test@example.com",
        username: "testuser",
        name: Name(firstname: "John", lastname: "Doe"),
        address: Address(city: 'City', street: 'Street', number: "123", zipcode: "123455"),
        phone: "123-456-7890",
      )
    ];

      test('Debe retornar una lista de User cuando UserRepository.getUsers() es exitoso',
        () async {
      when(mockUserRepository.getUsers()).thenAnswer((_) async => Right(tUsers));

      final result = await useCase(unit);

      expect(result, Right(tUsers));
      verify(mockUserRepository.getUsers()).called(1);
      verifyNoMoreInteractions(mockUserRepository);
    });

  
}
