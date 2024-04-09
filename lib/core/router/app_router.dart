import 'package:auto_route/auto_route.dart';
import 'package:injectable/injectable.dart';
import '../../src/view/view.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(
  replaceInRouteName: 'Page,Route',
)
@Singleton()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: MainRoute.page, initial: true, children: [
          AutoRoute(page: HomeRouteTab.page),
          AutoRoute(page: MapRouteTab.page),
          AutoRoute(page: ExploreRouteTab.page),
        ]),
      ];
}
