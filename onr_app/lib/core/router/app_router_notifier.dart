import 'package:flutter/material.dart';
import 'package:onr_app/features/auth/presentation/blocs/auth/auth_bloc.dart';


class GoRouterNotifier extends ChangeNotifier {
  final AuthBloc _authBloc;

  AuthStatus _authStatus = AuthStatus.unknown;

  GoRouterNotifier(this._authBloc) {
    _authBloc.stream.listen((state) {
      if (state.status == AuthStatus.authenticated) {
        authStatus = AuthStatus.authenticated;
      } else if (state.status == AuthStatus.unauthenticated) {
        authStatus = AuthStatus.unauthenticated;
      } else {
        authStatus = AuthStatus.unknown;
      }
    });
  }

  AuthStatus get authStatus => _authStatus;

  set authStatus(AuthStatus value) {
    _authStatus = value;
    notifyListeners();
  }
}
