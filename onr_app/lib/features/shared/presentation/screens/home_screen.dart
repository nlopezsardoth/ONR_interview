import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onr_app/features/products/presentation/bloc/products_bloc.dart';
import 'package:onr_app/features/products/presentation/screens/products_screen.dart';
import 'package:onr_app/features/shared/presentation/widgets/custom_bottom_navigation.dart';
import 'package:onr_app/features/users/presentation/bloc/user_bloc.dart';
import 'package:onr_app/features/users/presentation/screens/users_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.pageIndex});

  static const name = 'home-screen';
  final int pageIndex;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with AutomaticKeepAliveClientMixin {
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(keepPage: true);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  final viewRoutes = const <Widget>[
    ProductsScreen(),
    UsersScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    super.build(context);

    if (pageController.hasClients) {
      pageController.animateToPage(
        widget.pageIndex,
        curve: Curves.easeInOut,
        duration: const Duration(milliseconds: 250),
      );
    }
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProductBloc>(
          create: (BuildContext context) => ProductBloc(),
        ),
        BlocProvider<UserBloc>(
          create: (BuildContext context) => UserBloc(),
        )
      ],
      child: Scaffold(
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: pageController,
          children: viewRoutes,
        ),
        bottomNavigationBar: CustomBottomNavigation(
          currentIndex: widget.pageIndex,
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
