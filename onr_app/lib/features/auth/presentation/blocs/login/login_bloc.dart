import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:onr_app/features/auth/data/inputs/email.dart';
import 'package:onr_app/features/auth/data/inputs/password.dart';
import 'package:onr_app/features/auth/domain/entities/user.dart';
import 'package:onr_app/features/auth/presentation/blocs/auth/auth_bloc.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthBloc _authBloc;

  LoginBloc({
    required AuthBloc authBloc,
  })  : _authBloc = authBloc,
        super(const LoginState()) {
    on<EmailChanged>(_onEmailChanged);
    on<PasswordChanged>(_onPasswordChanged);
    on<LoginSubmitted>(_onLoginSubmitted);
  }

  void _onEmailChanged(EmailChanged event, Emitter<LoginState> emit) {
    final email = Email.dirty(event.email);
    emit(state.copyWith(
      email: email,
      isValid: Formz.validate([email, state.password]),
    ));
  }

  void _onPasswordChanged(PasswordChanged event, Emitter<LoginState> emit) {
    final password = Password.dirty(event.password);
    emit(state.copyWith(
      password: password,
      isValid: Formz.validate([state.email, password]),
    ));
  }

  Future<void> _onLoginSubmitted(
      LoginSubmitted event, Emitter<LoginState> emit) async {
    if (!state.isValid) return;

    emit(state.copyWith(status: FormzSubmissionStatus.inProgress, isValid: true));

    try {
      _authBloc.add(Login(User(
        id: "-",
        email: state.email.value,
        password: state.password.value,
      )));

      await emit.forEach(
        _authBloc.stream,
        onData: (authState) {
          if (authState.status == AuthStatus.authenticated) {
            return state.copyWith(status: FormzSubmissionStatus.success);
          } else if (authState.status == AuthStatus.unauthenticated) {
            return state.copyWith(
              status: FormzSubmissionStatus.failure,
            );
          }
          return state;
        },
      );
    } catch (_) {
      emit(state.copyWith(status: FormzSubmissionStatus.failure));
    }
  }
}
