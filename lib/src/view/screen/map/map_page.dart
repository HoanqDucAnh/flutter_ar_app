import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_ar_app/src/model/artifact.dart';
import '../../shared_widget/shared_widget.dart';
import 'package:flutter_ar_app/core/initializer/app_initializer.dart';
import 'package:flutter_ar_app/core/router/app_router.dart';
import 'package:flutter_ar_app/src/view/screen/map/point.dart';

@RoutePage()
class MapPageTab extends StatefulWidget {
  final List<Artifact> artifacts = const [
    Artifact(
      name: 'Artifact 1',
      introductions: ['Introduction 1', 'Introduction 2'],
      imageSrc: 'https://media.macphun.com/img/uploads/customer/how-to/579/15531840725c93b5489d84e9.43781620.jpg?q=85&w=1340',
      x: 100,
      y: 100
    ),
    Artifact(
      name: 'Artifact 2',
      introductions: ['Introduction 1', 'Introduction 2'],
      imageSrc: 'https://media.macphun.com/img/uploads/customer/how-to/579/15531840725c93b5489d84e9.43781620.jpg?q=85&w=1340',
      x: 200,
      y: 200
    ),
    Artifact(
      name: 'Artifact 3',
      introductions: ['Introduction 1', 'Introduction 2'],
      imageSrc: 'https://media.macphun.com/img/uploads/customer/how-to/579/15531840725c93b5489d84e9.43781620.jpg?q=85&w=1340',
      x: 300,
      y: 300
    ),
  ];

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
              for (Artifact artifact in widget.artifacts)
                Point(artifact: artifact)
            ],
          ),
        ),
    );
  }
}
