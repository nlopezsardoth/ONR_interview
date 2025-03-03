import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onr_app/features/auth/presentation/blocs/auth/auth_bloc.dart';
import 'package:onr_app/features/shared/utils/extensions/context_extensions.dart';
import 'package:onr_app/features/shared/utils/ui_utils/overlay/error_bottom_sheet_overlay.dart';
import 'package:onr_app/features/users/presentation/bloc/user_bloc.dart';
import 'package:onr_app/features/users/presentation/views/users_view.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserBloc()..add(LoadUsers()),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            context.l10n.products_tile,
            style: context.theme.textTheme.titleLarge,
          ),
          leading: IconButton(
            onPressed: () => context.read<AuthBloc>().add(Logout()),
            icon: Icon(Icons.logout),
          ),
        ),
        body: ErrorBottomSheetOverlay(
          errorBottomSheetStatus:
              context.read<UserBloc>().errorBottomSheetStatus,
          child: UsersView(),
        ),
      ),
    );
  }
}
