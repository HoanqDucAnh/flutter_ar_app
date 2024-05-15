import 'package:auto_route/auto_route.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ar_app/core/initializer/app_initializer.dart';
import 'package:flutter_ar_app/shared/color/app_colors.dart';
import 'package:flutter_ar_app/shared/shared.dart';
import 'package:flutter_ar_app/src/model/model.dart';
import 'package:flutter_ar_app/src/view/shared_widget/bottom_navigation/utils/constants.dart';

class CustomNavigationBottomBar extends StatefulWidget {
  const CustomNavigationBottomBar(
      {super.key, required this.tabsRouter, required this.selectedMenuIndex});
  final TabsRouter tabsRouter;
  final ValueNotifier<int> selectedMenuIndex;

  @override
  State<CustomNavigationBottomBar> createState() =>
      _CustomNavigationBottomBarState();
}

class _CustomNavigationBottomBarState extends State<CustomNavigationBottomBar> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final AppColors appColors = getIt<AppColors>();
    final LayoutConstants layoutConstants = getIt<LayoutConstants>();

    return CurvedNavigationBar(
      buttonBackgroundColor: appColors.linearColorPurple,
      color: appColors.secondaryColor,
      backgroundColor: appColors.backgroundColor,
      height: AppDimen.of(context).screenHeight * 0.08,
      items: [
        CurvedNavigationBarItem(
          child: Icon(
            Icons.home,
            size: 20,
            color: appColors.primaryColor,
          ),
          label: 'Nhà',
        ),
        CurvedNavigationBarItem(
          child: Icon(
            Icons.explore,
            size: 20,
            color: appColors.primaryColor,
          ),
          label: 'Khám phá',
        ),
        CurvedNavigationBarItem(
          child: Icon(
            Icons.book,
            size: 20,
            color: appColors.primaryColor,
          ),
          label: 'Bài học',
        ),
        CurvedNavigationBarItem(
          child: Icon(
            Icons.favorite,
            size: 20,
            color: appColors.primaryColor,
          ),
          label: 'Yêu thích',
        ),
      ],
      onTap: widget.tabsRouter.setActiveIndex,
    );
  }
}
