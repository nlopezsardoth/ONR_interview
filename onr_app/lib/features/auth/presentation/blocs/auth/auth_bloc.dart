import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:onr_app/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:onr_app/features/auth/domain/entities/auth_user.dart';
import 'package:onr_app/features/auth/domain/usecases/login_usecase.dart';
import 'package:onr_app/features/auth/domain/usecases/logout_usecase.dart';
import 'package:onr_app/features/shared/presentation/widgets/errors/error_bottom_sheet.dart';
import 'package:onr_app/features/shared/utils/ui_utils/overlay/error_bottom_sheet_model.dart';
import 'package:onr_app/features/shared/utils/ui_utils/overlay/loading_status_model.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState>
    with LoadingStatusMixin, ErrorBottomSheetStatusMixin {
  final LoginUseCase _loginUseCase;
  final LogoutUseCase _logoutUseCase;

  AuthBloc({
    LoginUseCase? loginUseCase,
    LogoutUseCase? logoutUseCase,
  })  : _loginUseCase = loginUseCase ?? LoginUseCase(AuthRepositoryImpl()),
        _logoutUseCase = logoutUseCase ?? LogoutUseCase(AuthRepositoryImpl()),
        super(const AuthState.unknown()) {
    loadingStatus.setIsInitialized(true);
    on<Login>(_onLogin);
    on<Logout>(_onLogout);
    on<CheckStatus>(_onCheckStatus);
  }

  Future<void> _onLogin(Login event, Emitter<AuthState> emit) async {
    loadingStatus.begin();
    final logInResponse =
        await _loginUseCase.call((event.user.email, event.user.password));
    logInResponse.fold(
      (failure) {
        loadingStatus.end();
        emit(AuthState.unauthenticated());
        errorBottomSheetStatus.postSomethingWentWrongError();
      },
      (user) {
        loadingStatus.end();
        emit(AuthState.authenticated(user));
      },
    );
  }

  Future<void> _onLogout(Logout event, Emitter<AuthState> emit) async {
    loadingStatus.begin();
    final result = await _logoutUseCase.call(unit);
    loadingStatus.end();

    result.fold(
      (failure) => errorBottomSheetStatus
          .post(BottomSheetErrorType(ErrorType.somethingWentWrong)),
      (_) => emit(AuthState.unauthenticated()),
    );
  }

  FutureOr<void> _onCheckStatus(
    CheckStatus event,
    Emitter<AuthState> emit,
  ) async {
    await Future.delayed(const Duration(milliseconds: 500));
    emit(AuthState.unauthenticated());
  }
}
