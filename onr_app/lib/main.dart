import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onr_app/core/l10n/onr_localizations.dart';
import 'package:onr_app/core/router/app_router.dart';
import 'package:onr_app/core/router/app_router_notifier.dart';
import 'package:onr_app/core/theme/them.dart';
import 'package:onr_app/features/auth/presentation/blocs/auth/auth_bloc.dart';
import 'package:onr_app/features/auth/presentation/blocs/login/login_bloc.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        BlocProvider(create: (_) => AuthBloc()..add(CheckStatus())),
        BlocProvider(create: (context) => LoginBloc(authBloc: context.read<AuthBloc>())),
        ChangeNotifierProvider(
            create: (context) => GoRouterNotifier(context.read<AuthBloc>())),
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: createRouter(context),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: ONRTheme().getTheme(),
    );
  }
}
