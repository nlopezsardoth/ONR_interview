

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:onr_app/features/shared/utils/extensions/context_extensions.dart';

class CustomBottomNavigation extends StatelessWidget {

  final int currentIndex;

  const CustomBottomNavigation({
    super.key, 
    required this.currentIndex
  });

  void onItemTapped( BuildContext context, int index ) {
    switch(index) {
      case 0:
        context.go('/home/0');
        break;
      
      case 1:
        context.go('/home/1');
        break;

    }
  }


  @override
  Widget build(BuildContext context) {

    final colors = context.theme.colorScheme;

    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (value) => onItemTapped(context, value),
      elevation: 0,
      selectedItemColor: colors.primary,
      items: [
        BottomNavigationBarItem(
          icon: Icon( Icons.shopping_cart),
          label: context.l10n.products_tile
        ),
        BottomNavigationBarItem(
          icon: Icon( Icons.person),
          label: context.l10n.users_title,
        ),
      ]
    );
  }
}