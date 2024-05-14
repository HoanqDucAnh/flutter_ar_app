import 'package:auto_route/auto_route.dart';
import 'package:injectable/injectable.dart';
import '../../src/view/view.dart';
import '../../src/view/shared_widget/shared_widget.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(
  replaceInRouteName: 'Page,Route',
)
@Singleton()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: OnboardingRouteTab.page, initial: true),
        AutoRoute(
          page: MainRoute.page,
          children: [
            AutoRoute(page: HomeRouteTab.page, children: [
              AutoRoute(page: HomeRoute.page, initial: true),
            ]),
            AutoRoute(
              page: ExploreRouteTab.page,
            ),
            AutoRoute(
              page: LessonRouteTab.page,
            ),
            AutoRoute(
              page: FavouriteRouteTab.page,
            ),
          ],
        ),
        CustomRoute(
            page: CameraRouteTab.page,
            transitionsBuilder: TransitionsBuilders.slideRightWithFade,
            durationInMilliseconds: 200),
        AutoRoute(
          page: MapRoute.page,
        ),
        AutoRoute(
          page: DetailRouteTab.page,
        ),
      ];
}
