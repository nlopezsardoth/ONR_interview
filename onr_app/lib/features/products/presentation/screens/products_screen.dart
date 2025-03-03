import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onr_app/features/auth/presentation/blocs/auth/auth_bloc.dart';
import 'package:onr_app/features/products/presentation/bloc/products_bloc.dart';
import 'package:onr_app/features/products/presentation/views/products_view.dart';
import 'package:onr_app/features/shared/utils/extensions/context_extensions.dart';
import 'package:onr_app/features/shared/utils/ui_utils/overlay/error_bottom_sheet_overlay.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductBloc()..add(LoadProducts()),
      child: ErrorBottomSheetOverlay(
        errorBottomSheetStatus:
            context.read<ProductBloc>().errorBottomSheetStatus,
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
          body: ProductsView(),
        ),
      ),
    );
  }
}