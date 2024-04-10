import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../../../../core/router/app_router.dart';

class CustomNavigationBottomBar extends StatelessWidget {
  const CustomNavigationBottomBar({super.key, required this.tabsRouter});
  final TabsRouter tabsRouter;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.map),
          label: 'Map',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.explore),
          label: 'Explore',
        ),
      ],
      onTap: tabsRouter.setActiveIndex,
      currentIndex: tabsRouter.activeIndex,
    );
  }
}
