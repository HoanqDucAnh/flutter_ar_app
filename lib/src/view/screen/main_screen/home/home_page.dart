import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_ar_app/core/initializer/app_initializer.dart';
import 'package:flutter_ar_app/shared/shared.dart';
import 'widget/widget.dart';

@RoutePage()
class HomePageTab extends StatefulWidget {
  const HomePageTab({super.key});

  @override
  State<HomePageTab> createState() => _HomePageTabState();
}

class _HomePageTabState extends State<HomePageTab>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return const AutoRouter();
  }
}
