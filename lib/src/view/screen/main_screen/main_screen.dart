import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ar_app/core/initializer/app_initializer.dart';
import 'package:flutter_ar_app/shared/color/app_colors.dart';
import '../../../../core/router/router.dart';
import '../../shared_widget/shared_widget.dart';

@RoutePage()
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final ValueNotifier<int> _selectedMenuIndex = ValueNotifier(0);
  final AppColors appColors = getIt<AppColors>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: AutoTabsScaffold(
        appBarBuilder: (context, tabsRouter) => const CustomAppBar(),
        routes: const [
          HomeRouteTab(),
          ExploreRouteTab(),
          FavouriteRouteTab(),
        ],
        bottomNavigationBuilder: (_, tabsRouter) {
          return ValueListenableBuilder<int>(
            valueListenable: _selectedMenuIndex,
            builder: (BuildContext context, int value, Widget? child) {
              return CustomNavigationBottomBar(
                tabsRouter: tabsRouter,
                selectedMenuIndex: _selectedMenuIndex,
              );
            },
          );
        },
        resizeToAvoidBottomInset: false,
        extendBody: true,
      ),
    );
  }
}
