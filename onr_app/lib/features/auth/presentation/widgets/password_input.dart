import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onr_app/core/l10n/onr_localizations.dart';
import 'package:onr_app/features/auth/data/inputs/password.dart';
import 'package:onr_app/features/auth/presentation/blocs/login/login_bloc.dart';
import 'package:onr_app/features/shared/utils/extensions/context_extensions.dart';

class PasswordInput extends StatelessWidget {
  const PasswordInput({super.key});

  @override
  Widget build(BuildContext context) {
    final AppLocalizations l10n = context.l10n;
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        String? errorText = _getPasswordErrorText(state, l10n);
        return TextField(
          onChanged: (password) => context.read<LoginBloc>().add(PasswordChanged(password)),
          decoration: InputDecoration(
            labelText: l10n.password_input_label,
            errorText: errorText,
          ),
          obscureText: true,
        );
      },
    );
  }
}

String? _getPasswordErrorText(LoginState state, AppLocalizations l10n) {
    final error = state.password.displayError;
    if (error == null) return null;
    return error == PasswordValidationError.empty
        ? l10n.empty_field_error_text
        : l10n.password_too_short_error_text;
  }