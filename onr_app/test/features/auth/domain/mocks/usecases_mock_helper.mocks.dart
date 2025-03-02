// Mocks generated by Mockito 5.4.5 from annotations
// in onr_app/test/features/auth/domain/mocks/usecases_mock_helper.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;

import 'package:dartz/dartz.dart' as _i3;
import 'package:mockito/mockito.dart' as _i1;
import 'package:onr_app/features/auth/domain/entities/user.dart' as _i7;
import 'package:onr_app/features/auth/domain/repositories/auth_repository.dart'
    as _i2;
import 'package:onr_app/features/auth/domain/usecases/login_usecase.dart'
    as _i4;
import 'package:onr_app/features/auth/domain/usecases/logout_usecase.dart'
    as _i8;
import 'package:onr_app/features/shared/data/errors/failures.dart' as _i6;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: must_be_immutable
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeAuthRepository_0 extends _i1.SmartFake
    implements _i2.AuthRepository {
  _FakeAuthRepository_0(Object parent, Invocation parentInvocation)
    : super(parent, parentInvocation);
}

class _FakeEither_1<L, R> extends _i1.SmartFake implements _i3.Either<L, R> {
  _FakeEither_1(Object parent, Invocation parentInvocation)
    : super(parent, parentInvocation);
}

/// A class which mocks [LoginUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockLoginUseCase extends _i1.Mock implements _i4.LoginUseCase {
  MockLoginUseCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.AuthRepository get repository =>
      (super.noSuchMethod(
            Invocation.getter(#repository),
            returnValue: _FakeAuthRepository_0(
              this,
              Invocation.getter(#repository),
            ),
          )
          as _i2.AuthRepository);

  @override
  _i5.Future<_i3.Either<_i6.Failure, _i7.User>> call((String, String)? input) =>
      (super.noSuchMethod(
            Invocation.method(#call, [input]),
            returnValue: _i5.Future<_i3.Either<_i6.Failure, _i7.User>>.value(
              _FakeEither_1<_i6.Failure, _i7.User>(
                this,
                Invocation.method(#call, [input]),
              ),
            ),
          )
          as _i5.Future<_i3.Either<_i6.Failure, _i7.User>>);
}

/// A class which mocks [LogoutUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockLogoutUseCase extends _i1.Mock implements _i8.LogoutUseCase {
  MockLogoutUseCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.AuthRepository get repository =>
      (super.noSuchMethod(
            Invocation.getter(#repository),
            returnValue: _FakeAuthRepository_0(
              this,
              Invocation.getter(#repository),
            ),
          )
          as _i2.AuthRepository);

  @override
  _i5.Future<_i3.Either<_i6.Failure, _i3.Unit>> call(_i3.Unit? noParams) =>
      (super.noSuchMethod(
            Invocation.method(#call, [noParams]),
            returnValue: _i5.Future<_i3.Either<_i6.Failure, _i3.Unit>>.value(
              _FakeEither_1<_i6.Failure, _i3.Unit>(
                this,
                Invocation.method(#call, [noParams]),
              ),
            ),
          )
          as _i5.Future<_i3.Either<_i6.Failure, _i3.Unit>>);
}
