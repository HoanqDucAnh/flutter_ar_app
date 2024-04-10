import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ar_app/core/initializer/app_initializer.dart';
import '../../../core/router/router.dart';
import '../shared_widget/shared_widget.dart';

@RoutePage()
class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('flutter'),
        leading: Builder(builder: (context) {
          return IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          );
        }),
      ),
      drawer: const CustomDrawer(),
      body: AutoTabsScaffold(
        routes: const [
          HomeRouteTab(),
          MapRouteTab(),
          ExploreRouteTab(),
        ],
        bottomNavigationBuilder: (_, tabsRouter) {
          return CustomNavigationBottomBar(tabsRouter: tabsRouter);
        },
      ),
    );
  }
}
