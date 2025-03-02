import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:onr_app/features/auth/data/inputs/email.dart';
import 'package:onr_app/features/auth/data/inputs/password.dart';
import 'package:onr_app/features/auth/domain/entities/user.dart';
import 'package:onr_app/features/auth/presentation/blocs/auth/auth_bloc.dart';
import 'package:onr_app/features/auth/presentation/blocs/login/login_bloc.dart';
import 'package:formz/formz.dart';

import '../mocks/blocs_mock_helper.mocks.dart';

void main() {
  late MockAuthBloc mockAuthBloc;
  late LoginBloc loginBloc;

  setUp(() {
    mockAuthBloc = MockAuthBloc();
    loginBloc = LoginBloc(authBloc: mockAuthBloc);
  });

  tearDown(() {
    loginBloc.close();
  });

  test('initial state should be LoginState()', () {
    expect(loginBloc.state, equals(const LoginState()));
  });

  blocTest<LoginBloc, LoginState>(
    'emits updated email state when EmailChanged is added',
    build: () => loginBloc,
    act: (bloc) => bloc.add(const EmailChanged('test@example.com')),
    expect: () => [
      LoginState(email: Email.dirty('test@example.com'), isValid: false),
    ],
  );

  blocTest<LoginBloc, LoginState>(
    'emits updated password state when PasswordChanged is added',
    build: () => loginBloc,
    act: (bloc) => bloc.add(const PasswordChanged('password123')),
    expect: () => [
      LoginState(password: Password.dirty('password123'), isValid: false),
    ],
  );

  blocTest<LoginBloc, LoginState>(
    'does not proceed with login if form is invalid',
    build: () => loginBloc,
    act: (bloc) => bloc.add(const LoginSubmitted()),
    expect: () => [],
  );

  blocTest<LoginBloc, LoginState>(
    'emits loading and success when login is successful',
    build: () {
      when(mockAuthBloc.stream).thenAnswer((_) => Stream.value(AuthState.authenticated(User(id: '1', email: 'test@example.com', password: 'password123'))));
      return loginBloc;
    },
    act: (bloc) {
      bloc.add(const EmailChanged('test@example.com'));
      bloc.add(const PasswordChanged('password123'));
      bloc.add(const LoginSubmitted());
    },
    expect: () => [
      LoginState(email: Email.dirty('test@example.com'), isValid: false),
      LoginState(email: Email.dirty('test@example.com'), password: Password.dirty('wrongpassword'), isValid: true),
      LoginState(email: Email.dirty('test@example.com'), password: Password.dirty('password123'), status: FormzSubmissionStatus.inProgress, isValid: true),
      LoginState(email: Email.dirty('test@example.com'), password: Password.dirty('password123'), status: FormzSubmissionStatus.success, isValid: true),    ],
    );

  blocTest<LoginBloc, LoginState>(
    'emits loading and failure when login fails',
    build: () {
      when(mockAuthBloc.stream).thenAnswer((_) => Stream.value(AuthState.unauthenticated()));
      return loginBloc;
    },
    act: (bloc) {
      bloc.add(const EmailChanged('test@example.com'));
      bloc.add(const PasswordChanged('wrongpassword'));
      bloc.add(const LoginSubmitted());
    },
    expect: () => [
      LoginState(email: Email.dirty('test@example.com'), isValid: false),
      LoginState(email: Email.dirty('test@example.com'), password: Password.dirty('wrongpassword'), isValid: true),
      LoginState(email: Email.dirty('test@example.com'), password: Password.dirty('wrongpassword'), status: FormzSubmissionStatus.inProgress, isValid: true),
      LoginState(email: Email.dirty('test@example.com'), password: Password.dirty('wrongpassword'), status: FormzSubmissionStatus.failure, isValid: true),
    ],
  );
}
