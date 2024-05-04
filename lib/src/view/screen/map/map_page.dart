import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_ar_app/core/initializer/app_initializer.dart';
import 'package:flutter_ar_app/core/router/app_router.dart';

@RoutePage()
class MapPageTab extends StatefulWidget {
  const MapPageTab({super.key});

  @override
  State<MapPageTab> createState() => _MapPageTabState();
}

class _MapPageTabState extends State<MapPageTab> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          getIt<AppRouter>().navigate(const HomeRouteTab());
        },
        child: const Text('Go to Home Page'),
      ),
    );
  }
}
