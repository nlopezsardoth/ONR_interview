// Mocks generated by Mockito 5.4.5 from annotations
// in onr_app/test/features/auth/presentation/mocks/blocs_mock_helper.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i6;

import 'package:bloc/bloc.dart' as _i7;
import 'package:mockito/mockito.dart' as _i1;
import 'package:onr_app/features/auth/presentation/blocs/auth/auth_bloc.dart'
    as _i2;
import 'package:onr_app/features/auth/presentation/blocs/login/login_bloc.dart'
    as _i5;
import 'package:onr_app/features/shared/utils/ui_utils/overlay/error_bottom_sheet_model.dart'
    as _i4;
import 'package:onr_app/features/shared/utils/ui_utils/overlay/loading_status_model.dart'
    as _i3;

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

class _FakeAuthState_0 extends _i1.SmartFake implements _i2.AuthState {
  _FakeAuthState_0(Object parent, Invocation parentInvocation)
    : super(parent, parentInvocation);
}

class _FakeLoadingStatusCubit_1 extends _i1.SmartFake
    implements _i3.LoadingStatusCubit {
  _FakeLoadingStatusCubit_1(Object parent, Invocation parentInvocation)
    : super(parent, parentInvocation);
}

class _FakeErrorBottomSheetCubit_2 extends _i1.SmartFake
    implements _i4.ErrorBottomSheetCubit {
  _FakeErrorBottomSheetCubit_2(Object parent, Invocation parentInvocation)
    : super(parent, parentInvocation);
}

class _FakeLoginState_3 extends _i1.SmartFake implements _i5.LoginState {
  _FakeLoginState_3(Object parent, Invocation parentInvocation)
    : super(parent, parentInvocation);
}

/// A class which mocks [AuthBloc].
///
/// See the documentation for Mockito's code generation for more information.
class MockAuthBloc extends _i1.Mock implements _i2.AuthBloc {
  MockAuthBloc() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.AuthState get state =>
      (super.noSuchMethod(
            Invocation.getter(#state),
            returnValue: _FakeAuthState_0(this, Invocation.getter(#state)),
          )
          as _i2.AuthState);

  @override
  _i6.Stream<_i2.AuthState> get stream =>
      (super.noSuchMethod(
            Invocation.getter(#stream),
            returnValue: _i6.Stream<_i2.AuthState>.empty(),
          )
          as _i6.Stream<_i2.AuthState>);

  @override
  bool get isClosed =>
      (super.noSuchMethod(Invocation.getter(#isClosed), returnValue: false)
          as bool);

  @override
  _i3.LoadingStatusCubit get loadingStatus =>
      (super.noSuchMethod(
            Invocation.getter(#loadingStatus),
            returnValue: _FakeLoadingStatusCubit_1(
              this,
              Invocation.getter(#loadingStatus),
            ),
          )
          as _i3.LoadingStatusCubit);

  @override
  _i4.ErrorBottomSheetCubit get errorBottomSheetStatus =>
      (super.noSuchMethod(
            Invocation.getter(#errorBottomSheetStatus),
            returnValue: _FakeErrorBottomSheetCubit_2(
              this,
              Invocation.getter(#errorBottomSheetStatus),
            ),
          )
          as _i4.ErrorBottomSheetCubit);

  @override
  void add(_i2.AuthEvent? event) => super.noSuchMethod(
    Invocation.method(#add, [event]),
    returnValueForMissingStub: null,
  );

  @override
  void onEvent(_i2.AuthEvent? event) => super.noSuchMethod(
    Invocation.method(#onEvent, [event]),
    returnValueForMissingStub: null,
  );

  @override
  void emit(_i2.AuthState? state) => super.noSuchMethod(
    Invocation.method(#emit, [state]),
    returnValueForMissingStub: null,
  );

  @override
  void on<E extends _i2.AuthEvent>(
    _i7.EventHandler<E, _i2.AuthState>? handler, {
    _i7.EventTransformer<E>? transformer,
  }) => super.noSuchMethod(
    Invocation.method(#on, [handler], {#transformer: transformer}),
    returnValueForMissingStub: null,
  );

  @override
  void onTransition(_i7.Transition<_i2.AuthEvent, _i2.AuthState>? transition) =>
      super.noSuchMethod(
        Invocation.method(#onTransition, [transition]),
        returnValueForMissingStub: null,
      );

  @override
  _i6.Future<void> close() =>
      (super.noSuchMethod(
            Invocation.method(#close, []),
            returnValue: _i6.Future<void>.value(),
            returnValueForMissingStub: _i6.Future<void>.value(),
          )
          as _i6.Future<void>);

  @override
  void onChange(_i7.Change<_i2.AuthState>? change) => super.noSuchMethod(
    Invocation.method(#onChange, [change]),
    returnValueForMissingStub: null,
  );

  @override
  void addError(Object? error, [StackTrace? stackTrace]) => super.noSuchMethod(
    Invocation.method(#addError, [error, stackTrace]),
    returnValueForMissingStub: null,
  );

  @override
  void onError(Object? error, StackTrace? stackTrace) => super.noSuchMethod(
    Invocation.method(#onError, [error, stackTrace]),
    returnValueForMissingStub: null,
  );
}

/// A class which mocks [LoginBloc].
///
/// See the documentation for Mockito's code generation for more information.
class MockLoginBloc extends _i1.Mock implements _i5.LoginBloc {
  MockLoginBloc() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.LoginState get state =>
      (super.noSuchMethod(
            Invocation.getter(#state),
            returnValue: _FakeLoginState_3(this, Invocation.getter(#state)),
          )
          as _i5.LoginState);

  @override
  _i6.Stream<_i5.LoginState> get stream =>
      (super.noSuchMethod(
            Invocation.getter(#stream),
            returnValue: _i6.Stream<_i5.LoginState>.empty(),
          )
          as _i6.Stream<_i5.LoginState>);

  @override
  bool get isClosed =>
      (super.noSuchMethod(Invocation.getter(#isClosed), returnValue: false)
          as bool);

  @override
  void add(_i5.LoginEvent? event) => super.noSuchMethod(
    Invocation.method(#add, [event]),
    returnValueForMissingStub: null,
  );

  @override
  void onEvent(_i5.LoginEvent? event) => super.noSuchMethod(
    Invocation.method(#onEvent, [event]),
    returnValueForMissingStub: null,
  );

  @override
  void emit(_i5.LoginState? state) => super.noSuchMethod(
    Invocation.method(#emit, [state]),
    returnValueForMissingStub: null,
  );

  @override
  void on<E extends _i5.LoginEvent>(
    _i7.EventHandler<E, _i5.LoginState>? handler, {
    _i7.EventTransformer<E>? transformer,
  }) => super.noSuchMethod(
    Invocation.method(#on, [handler], {#transformer: transformer}),
    returnValueForMissingStub: null,
  );

  @override
  void onTransition(
    _i7.Transition<_i5.LoginEvent, _i5.LoginState>? transition,
  ) => super.noSuchMethod(
    Invocation.method(#onTransition, [transition]),
    returnValueForMissingStub: null,
  );

  @override
  _i6.Future<void> close() =>
      (super.noSuchMethod(
            Invocation.method(#close, []),
            returnValue: _i6.Future<void>.value(),
            returnValueForMissingStub: _i6.Future<void>.value(),
          )
          as _i6.Future<void>);

  @override
  void onChange(_i7.Change<_i5.LoginState>? change) => super.noSuchMethod(
    Invocation.method(#onChange, [change]),
    returnValueForMissingStub: null,
  );

  @override
  void addError(Object? error, [StackTrace? stackTrace]) => super.noSuchMethod(
    Invocation.method(#addError, [error, stackTrace]),
    returnValueForMissingStub: null,
  );

  @override
  void onError(Object? error, StackTrace? stackTrace) => super.noSuchMethod(
    Invocation.method(#onError, [error, stackTrace]),
    returnValueForMissingStub: null,
  );
}
