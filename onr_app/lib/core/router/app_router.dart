import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:onr_app/core/router/app_router_notifier.dart';
import 'package:onr_app/features/auth/presentation/blocs/auth/auth_bloc.dart';
import 'package:onr_app/features/auth/presentation/screens/login_screen.dart';
import 'package:onr_app/features/products/presentation/screens/product_screen.dart';
import 'package:onr_app/features/shared/presentation/screens/home_screen.dart';
import 'package:onr_app/features/shared/presentation/screens/splash_screen.dart';
import 'package:provider/provider.dart';

GoRouter createRouter(BuildContext context) {
  final goRouterNotifier = context.read<GoRouterNotifier>();

  return GoRouter(
    initialLocation: '/splash',
    refreshListenable: goRouterNotifier,
    routes: [
      GoRoute(
        path: '/splash',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/home/:page',
        name: HomeScreen.name,
        builder: (context, state) {
          final pageIndex = int.parse(state.pathParameters['page'] ?? '0');

          return HomeScreen(pageIndex: pageIndex);
        },
        routes: [
          GoRoute(
            path: 'product/:id',
            name: ProductScreen.name,
            builder: (context, state) {
              final productId = int.parse(state.pathParameters['id'] ?? '0');

              return ProductScreen(productId: productId);
            },
          ),
        ],
      ),
    ],
    redirect: (context, state) {
      final isGoingTo = state.uri.path;
      final authStatus = goRouterNotifier.authStatus;

      if (isGoingTo == '/splash' && authStatus == AuthStatus.unknown) {
        return null;
      }

      if (authStatus == AuthStatus.unauthenticated) {
        if (isGoingTo == '/login') return null;

        return '/login';
      }

      if (authStatus == AuthStatus.authenticated) {
        if (isGoingTo == '/login' || isGoingTo == '/splash') {
          return '/home/0';
        }
      }

      return null;
    },
  );
}

// final appRouter = GoRouter(
//   initialLocation: '/splash',
  
//   routes: [
//     GoRoute(
//         path: '/splash',
//         builder: (context, state) => const SplashScreen(),
//       ),
//   ],

//   redirect: (context, state) {
      
//       final isGoingTo = state.matchedLocation;
//       final authStatus =    .authStatus;

//       if ( isGoingTo == '/splash' && authStatus == AuthStatus.unknown) return null;

//       if ( authStatus == AuthStatus.unauthenticated ) {
//         if ( isGoingTo == '/login') return null;

//         return '/login';
//       }

//       if ( authStatus == AuthStatus.authenticated ) {
//         if ( isGoingTo == '/login' || isGoingTo == '/splash' ){
//            return '/';
//         }
//       }


//       return null;
//     },
//   );
