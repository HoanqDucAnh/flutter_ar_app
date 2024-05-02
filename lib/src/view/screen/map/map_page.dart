import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import '../../shared_widget/shared_widget.dart';
import 'package:flutter_ar_app/core/initializer/app_initializer.dart';
import 'package:flutter_ar_app/core/router/app_router.dart';
import 'package:flutter_ar_app/src/view/screen/map/point.dart';

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
      child: InteractiveViewer(
          maxScale: 2,
          child: Stack(
            children: [
              Image.network('https://media.macphun.com/img/uploads/customer/how-to/579/15531840725c93b5489d84e9.43781620.jpg?q=85&w=1340'),
              Point(x: -10, y: 100),
              Point(x: 20, y: 200),
            ],
          ),
        ),
    );
  }
}
