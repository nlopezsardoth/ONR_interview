import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:onr_app/features/users/domain/entities/user.dart';
import 'package:onr_app/features/users/presentation/bloc/user_bloc.dart';

import '../../domain/mocks/usecases_mock_helper.mocks.dart';

void main() {
  late UserBloc userBloc;
  late MockGetUsersUseCase mockGetUsersUseCase;

  setUp(() {
    mockGetUsersUseCase = MockGetUsersUseCase();
    userBloc = UserBloc(getUsersUseCase: mockGetUsersUseCase);
  });

  final mockUser = const User(
    id: 1,
    email: "test@example.com",
    username: "testuser",
    name: Name(firstname: "John", lastname: "Doe"),
    address: Address(
        city: 'City', street: 'Street', number: "123", zipcode: "123455"),
    phone: "123-456-7890",
  );

  final mockUsers = [mockUser, mockUser.copyWith(id: 2)];

  group('UserBloc', () {
    blocTest<UserBloc, UserState>(
      'Emits [loading, success] when fetching users is successful',
      build: () {
        when(mockGetUsersUseCase.call(any))
            .thenAnswer((_) async => Right(mockUsers));
        return userBloc;
      },
      act: (bloc) => bloc.add(LoadUsers()),
      expect: () => [
        const UserState(status: UserStatus.loading),
        UserState(status: UserStatus.success, users: mockUsers),
      ],
    );
  });
}
