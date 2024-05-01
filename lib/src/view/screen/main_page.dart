import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../../../core/router/router.dart';
import '../shared_widget/shared_widget.dart';

@RoutePage()
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        key: scaffoldKey,
        appBar: CustomAppBar(
          appName: 'Flutter AR App',
          scaffoldKey: scaffoldKey,
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
      ),
    );
  }
}
