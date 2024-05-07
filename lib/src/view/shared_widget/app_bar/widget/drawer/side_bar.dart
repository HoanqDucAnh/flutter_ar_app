import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ar_app/core/initializer/app_initializer.dart';
import 'package:flutter_ar_app/core/router/app_router.dart';

import '../../../../../model/menu.dart';
import '../../../../../../utils/rive_utils.dart';
import 'info_card.dart';
import 'side_menu.dart';

class SideBar extends StatefulWidget {
  final ValueNotifier<int> selectedMenuIndex;

  const SideBar({super.key,required this.selectedMenuIndex});

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  late Menu selectedSideMenu;

  @override
  void initState() {
    super.initState();
    selectedSideMenu = sidebarMenus[widget.selectedMenuIndex.value];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 288,
      height: double.infinity,
      decoration: const BoxDecoration(
        color: Color(0xFF17203A),
        // borderRadius: BorderRadius.all(
        //   Radius.circular(30),
        // ),
      ),
      child: DefaultTextStyle(
        style: const TextStyle(color: Colors.white),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const InfoCard(
                name: "Air Force and Air Defence",
                bio: "Museum",
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24, top: 32, bottom: 16),
                child: Text(
                  "Browse".toUpperCase(),
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Colors.white70),
                ),
              ),
              ...sidebarMenus
                  .asMap()
                  .entries
                  .map((entry) {
                    // int index = entry.key;
                    var menu = entry.value;
                    return SideMenu(
                      menu: menu,
                      selectedMenu: selectedSideMenu,
                      press: () {
                        RiveUtils.chnageSMIBoolState(menu.rive.status!);
                        setState(() {
                          selectedSideMenu = menu;
                          widget.selectedMenuIndex.value = entry.key;
                        });
                        getIt<AppRouter>().navigate(menu.tab);
                      },
                      riveOnInit: (artboard) {
                        menu.rive.status = RiveUtils.getRiveInput(artboard,
                            stateMachineName: menu.rive.stateMachineName);
                      },
                    );
                  })
                  .toList(),
              // Padding(
              //   padding: const EdgeInsets.only(left: 24, top: 40, bottom: 16),
              //   child: Text(
              //     "History".toUpperCase(),
              //     style: Theme.of(context)
              //         .textTheme
              //         .titleMedium!
              //         .copyWith(color: Colors.white70),
              //   ),
              // ),
              // ...sidebarMenus2
              //     .map((menu) => SideMenu(
              //           menu: menu,
              //           selectedMenu: selectedSideMenu,
              //           press: () {
              //             RiveUtils.chnageSMIBoolState(menu.rive.status!);
              //             setState(() {
              //               selectedSideMenu = menu;
              //             });
              //           },
              //           riveOnInit: (artboard) {
              //             menu.rive.status = RiveUtils.getRiveInput(artboard,
              //                 stateMachineName: menu.rive.stateMachineName);
              //           },
              //         ))
              //     .toList(),
            ],
          ),
        ),
      ),
    );
  }
}