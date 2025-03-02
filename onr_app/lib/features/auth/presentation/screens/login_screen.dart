import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onr_app/features/auth/presentation/blocs/auth/auth_bloc.dart';
import 'package:onr_app/features/auth/presentation/view/login_view.dart';
import 'package:onr_app/features/shared/utils/ui_utils/overlay/loading_status_overlay.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return LoadingStatusOverlay(
          loadingStatusCubit: context.read<AuthBloc>().loadingStatus,
          errorBottomSheetStatus:
              context.read<AuthBloc>().errorBottomSheetStatus,
          child: Scaffold(body: const LoginView()),
        );
      },
    );
  }
}
