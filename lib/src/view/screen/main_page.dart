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
  final ValueNotifier<int> _selectedMenuIndex = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
// <<<<<<< HEAD
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        key: scaffoldKey,
        appBar: CustomAppBar(
          appName: 'Flutter AR App',
          scaffoldKey: scaffoldKey,
        ),
        drawer: CustomDrawer(
          selectedMenuIndex: _selectedMenuIndex,
        ),
        body: AutoTabsScaffold(
// =======
    // return MediaQuery.removePadding(
    //   context: context,
    //   removeBottom: true,
    //   child: SafeArea(
    //     bottom: false,
    //     top: false,
    //     child: AutoTabsScaffold(
    //       appBarBuilder: (context, tabsRouter) => CustomAppBar(
    //         appName: 'Flutter AR App',
    //         scaffoldKey: scaffoldKey,
    //       ),
// >>>>>>> main
          routes: const [
            HomeRouteTab(),
            MapRouteTab(),
            ExploreRouteTab(),
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
      ),
    );
  }
}
