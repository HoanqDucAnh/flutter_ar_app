import 'package:flutter_ar_app/src/bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_ar_app/core/initializer/app_initializer.dart';
import 'package:flutter_ar_app/core/router/app_router.dart';
import 'package:flutter_ar_app/shared/shared.dart';

@RoutePage()
class ExplorePageTab extends StatefulWidget {
  const ExplorePageTab({super.key});

  @override
  State<ExplorePageTab> createState() => _ExplorePageTabState();
}

class _ExplorePageTabState extends State<ExplorePageTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        const Text('sadfsadf'),
        FloatingActionButton(
            onPressed: () =>
                AutoRouter.of(context).push(const CameraRouteTab()))
      ],
    ));
  }
}
