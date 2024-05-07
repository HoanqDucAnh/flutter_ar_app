import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_ar_app/core/initializer/app_initializer.dart';
import 'package:flutter_ar_app/shared/shared.dart';
import 'package:flutter_ar_app/src/controller/controller.dart';
import 'package:flutter_ar_app/src/controller/rive/rive_utils.dart';
import 'package:flutter_ar_app/src/view/shared_widget/bottom_navigation/widget/animated_bar.dart';
import 'package:flutter_ar_app/src/model/model.dart';
import 'package:flutter_ar_app/src/view/shared_widget/bottom_navigation/utils/constants.dart';
import 'package:rive/rive.dart';

class CustomNavigationBottomBar extends StatefulWidget {
  const CustomNavigationBottomBar({super.key, required this.tabsRouter, required this.selectedMenuIndex});
  final TabsRouter tabsRouter;
  final ValueNotifier<int> selectedMenuIndex;

  @override
  State<CustomNavigationBottomBar> createState() =>
      _CustomNavigationBottomBarState();
}

class _CustomNavigationBottomBarState extends State<CustomNavigationBottomBar> {
  late SMIBool searchTrigger;
  late RiveAsset selectedNavItem;

  @override
  void initState() {
    super.initState();
    selectedNavItem = bottomNavbarItems[widget.selectedMenuIndex.value];
  }

  @override
  Widget build(BuildContext context) {
    final AppColors appColors = getIt<AppColors>();
    final LayoutConstants layoutConstants = getIt<LayoutConstants>();
    selectedNavItem = bottomNavbarItems[widget.selectedMenuIndex.value];

    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Container(
        margin: layoutConstants.defaultMarginHorizontal,
        decoration: BoxDecoration(
          color: appColors.secondaryColorWithOpacity(0.9),
          borderRadius: layoutConstants.mediumBorderRadius,
        ),
        child: Padding(
          padding: layoutConstants.marginAllBottombar,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ...List.generate(bottomNavbarItems.length, (index) {
                return Expanded(
                  child: GestureDetector(
                    onTap: () {
                      widget.tabsRouter.setActiveIndex(index);
                      widget.selectedMenuIndex.value = index;
                      bottomNavbarItems[index].input!.change(true);
                      if (selectedNavItem != bottomNavbarItems[index]) {
                        setState(() {
                          selectedNavItem = bottomNavbarItems[index];
                        });
                      }
                      Future.delayed(const Duration(milliseconds: 2000), () {
                        bottomNavbarItems[index].input!.change(false);
                      });
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        AnimatedBar(
                            isSelected:
                                bottomNavbarItems[index] == selectedNavItem,
                            selectedNavItem: selectedNavItem,
                            appColors: appColors,
                            layoutConstants: layoutConstants),
                        SizedBox(
                          height: 36,
                          width: 36,
                          child: Opacity(
                            opacity: bottomNavbarItems[index] == selectedNavItem
                                ? 1
                                : 0.5,
                            child: RiveAnimation.asset(
                              bottomNavbarItems[index].path,
                              artboard: bottomNavbarItems[index].artboard,
                              onInit: (artboard) {
                                StateMachineController stateMachineController =
                                    RiveUtils.getRiveController(artboard,
                                        stateMachineName:
                                            bottomNavbarItems[index]
                                                .stateMachineName);
                                bottomNavbarItems[index].input =
                                    stateMachineController.findSMI(
                                            bottomNavbarItems[index].smiName)
                                        as SMIBool;
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              })
            ],
          ),
        ),
      ),
    );
    // return BottomNavigationBar(
    //   landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
    //   items: const [
    //     BottomNavigationBarItem(
    //       icon: Icon(
    //         Icons.home,
    //       ),
    //       label: 'Home',
    //     ),
    //     BottomNavigationBarItem(
    //       icon: Icon(
    //         Icons.map,
    //       ),
    //       label: 'Map',
    //     ),
    //     BottomNavigationBarItem(
    //       icon: Icon(
    //         Icons.explore,
    //       ),
    //       label: 'Explore',
    //     ),
    //   ],
    //   selectedIconTheme: IconThemeData(color: appColors.onSelectColor),
    //   unselectedIconTheme: IconThemeData(color: appColors.secondaryColor),
    //   onTap: tabsRouter.setActiveIndex,
    //   currentIndex: tabsRouter.activeIndex,
    // );
  }
}
