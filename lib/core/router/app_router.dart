import 'package:auto_route/auto_route.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter/material.dart';
import '../../src/view/view.dart';
import 'package:camera/camera.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(
  replaceInRouteName: 'Page,Route',
)
@Singleton()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        // AutoRoute(page: MainRoute.page, initial: true, children: [
        //   AutoRoute(page: HomeRouteTab.page),
        //   AutoRoute(page: MapRouteTab.page),
        //   AutoRoute(page: ExploreRouteTab.page),
        // ]),
        CustomRoute(
            page: MainRoute.page,
            initial: true,
            transitionsBuilder: TransitionsBuilders.fadeIn,
            children: [
              CustomRoute(
                  page: HomeRouteTab.page,
                  transitionsBuilder: TransitionsBuilders.slideRightWithFade,
                  durationInMilliseconds: 2000),
              CustomRoute(
                  page: MapRouteTab.page,
                  transitionsBuilder: TransitionsBuilders.slideRightWithFade,
                  durationInMilliseconds: 2000),
              CustomRoute(
                  page: ExploreRouteTab.page,
                  transitionsBuilder: TransitionsBuilders.slideRightWithFade,
                  durationInMilliseconds: 2000),
              CustomRoute(
                  page: CameraRouteTab.page,
                  transitionsBuilder: TransitionsBuilders.slideRightWithFade,
                  durationInMilliseconds: 2000),
            ]),
      ];
}
