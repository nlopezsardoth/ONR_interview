import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onr_app/features/auth/presentation/blocs/login/login_bloc.dart';
import 'package:onr_app/features/auth/presentation/widgets/email_input.dart';
import 'package:onr_app/features/auth/presentation/widgets/password_input.dart';
import 'package:onr_app/features/shared/utils/extensions/context_extensions.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          EmailInput(),
          const SizedBox(height: 16),
          PasswordInput(),
          const SizedBox(height: 24),
          BlocBuilder<LoginBloc, LoginState>(
              builder: (context, state) {
                return ElevatedButton(
                  onPressed: state.isValid
                      ? () => context.read<LoginBloc>().add(const LoginSubmitted())
                      : null,
                  child: Text(context.l10n.login_button_lable),
                );
              },
            ),
        ],
      ),
    );
  }
}



