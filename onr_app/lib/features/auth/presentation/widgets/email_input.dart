import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onr_app/core/l10n/onr_localizations.dart';
import 'package:onr_app/features/auth/data/inputs/email.dart';
import 'package:onr_app/features/auth/presentation/blocs/login/login_bloc.dart';
import 'package:onr_app/features/shared/utils/extensions/context_extensions.dart';

class EmailInput extends StatelessWidget {
  const EmailInput({super.key});

  @override
  Widget build(BuildContext context) {
    final AppLocalizations l10n = context.l10n;
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        String? errorText = _getEmailErrorText(state, l10n);
        return TextField(
          onChanged: (email) => context.read<LoginBloc>().add(EmailChanged(email)),
          decoration: InputDecoration(
            labelText: l10n.email_input_label,
            errorText: errorText,
          ),
          keyboardType: TextInputType.emailAddress,
        );
      },
    );
  }
}

String? _getEmailErrorText(LoginState state, AppLocalizations l10n) {
    final error = state.email.displayError;
    if (error == null) return null;
    return error == EmailValidationError.invalid
        ? l10n.invalid_email_error_text
        : l10n.empty_field_error_text;
  }