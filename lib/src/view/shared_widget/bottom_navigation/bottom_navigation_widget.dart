import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ar_app/core/initializer/app_initializer.dart';
import 'package:flutter_ar_app/shared/color/app_colors.dart';

class CustomNavigationBottomBar extends StatelessWidget {
  const CustomNavigationBottomBar({super.key, required this.tabsRouter});
  final TabsRouter tabsRouter;

  @override
  Widget build(BuildContext context) {
    final AppColors appColors = getIt<AppColors>();
    return BottomNavigationBar(
      landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.map,
          ),
          label: 'Map',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.explore,
          ),
          label: 'Explore',
        ),
      ],
      selectedIconTheme: IconThemeData(color: appColors.onSelectColor),
      unselectedIconTheme: IconThemeData(color: appColors.secondaryColor),
      onTap: tabsRouter.setActiveIndex,
      currentIndex: tabsRouter.activeIndex,
    );
  }
}
