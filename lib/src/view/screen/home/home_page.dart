import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_ar_app/core/initializer/app_initializer.dart';
import 'package:flutter_ar_app/core/router/app_router.dart';
import '../../shared_widget/shared_widget.dart';

@RoutePage()
class HomePageTab extends StatefulWidget {
  const HomePageTab({super.key});

  @override
  State<HomePageTab> createState() => _HomePageTabState();
}

class _HomePageTabState extends State<HomePageTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            getIt<AppRouter>().navigate(const MapRouteTab());
          },
          child: const Text('Go to Map Page'),
        ),
      ),
    );
  }
}
