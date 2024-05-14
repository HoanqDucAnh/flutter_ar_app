import 'package:auto_route/auto_route.dart';
import 'package:flutter_ar_app/core/router/router.dart';

import 'rive_model.dart';

class Menu {
  final String title;
  final RiveModel rive;
  final PageRouteInfo tab;

  Menu({required this.title, required this.rive, required this.tab});
}

List<Menu> sidebarMenus = [
  Menu(
    title: "Home",
    rive: RiveModel(
        src: "assets/RiveAssets/icons.riv",
        artboard: "HOME",
        stateMachineName: "HOME_interactivity"),
    tab: const HomeRouteTab(),
  ),
  Menu(
    title: "Map",
    rive: RiveModel(
        src: "lib/core/resources/rive_assets/nav_icons.riv",
        artboard: "ONLINE",
        stateMachineName: "State Machine 1"),
    tab: const MapRoute(),
  ),
  Menu(
      title: "Favorites",
      rive: RiveModel(
          src: "assets/RiveAssets/icons.riv",
          artboard: "LIKE/STAR",
          stateMachineName: "STAR_Interactivity"),
      tab: const ExploreRouteTab()),
//   Menu(
//     title: "Help",
//     rive: RiveModel(
//         src: "assets/RiveAssets/icons.riv",
//         artboard: "CHAT",
//         stateMachineName: "CHAT_Interactivity"),
//   ),
// ];
// List<Menu> sidebarMenus2 = [
//   Menu(
//     title: "History",
//     rive: RiveModel(
//         src: "assets/RiveAssets/icons.riv",
//         artboard: "TIMER",
//         stateMachineName: "TIMER_Interactivity"),
//   ),
//   Menu(
//     title: "Notifications",
//     rive: RiveModel(
//         src: "assets/RiveAssets/icons.riv",
//         artboard: "BELL",
//         stateMachineName: "BELL_Interactivity"),
//   ),
// ];

// List<Menu> bottomNavItems = [
//   Menu(
//     title: "Chat",
//     rive: RiveModel(
//         src: "assets/RiveAssets/icons.riv",
//         artboard: "CHAT",
//         stateMachineName: "CHAT_Interactivity"),
//   ),
//   Menu(
//     title: "Search",
//     rive: RiveModel(
//         src: "assets/RiveAssets/icons.riv",
//         artboard: "SEARCH",
//         stateMachineName: "SEARCH_Interactivity"),
//   ),
//   Menu(
//     title: "Timer",
//     rive: RiveModel(
//         src: "assets/RiveAssets/icons.riv",
//         artboard: "TIMER",
//         stateMachineName: "TIMER_Interactivity"),
//   ),
//   Menu(
//     title: "Notification",
//     rive: RiveModel(
//         src: "assets/RiveAssets/icons.riv",
//         artboard: "BELL",
//         stateMachineName: "BELL_Interactivity"),
//   ),
//   Menu(
//     title: "Profile",
//     rive: RiveModel(
//         src: "assets/RiveAssets/icons.riv",
//         artboard: "USER",
//         stateMachineName: "USER_Interactivity"),
//   ),
];
