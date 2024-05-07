import 'package:flutter_ar_app/src/model/model.dart';

List<RiveAsset> bottomNavbarItems = [
  RiveAsset(
    path: "lib/core/resources/rive_assets/nav_icons2.riv",
    artboard: 'HOME',
    stateMachineName: 'HOME_interactivity',
    title: 'Home',
    smiName: 'active',
  ),
  RiveAsset(
    path: "lib/core/resources/rive_assets/nav_icons.riv",
    artboard: 'ONLINE',
    stateMachineName: 'State Machine 1',
    title: 'Map',
    smiName: 'active',
  ),
  RiveAsset(
    path: "lib/core/resources/rive_assets/nav_icons.riv",
    artboard: 'LIKE/STAR',
    stateMachineName: 'STAR_Interactivity',
    title: 'Explore',
    smiName: 'active',
  ),
];
