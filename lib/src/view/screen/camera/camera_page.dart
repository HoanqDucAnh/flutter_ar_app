import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

@RoutePage()
class CameraPageTab extends StatefulWidget {
  const CameraPageTab({super.key, required this.camera});

  final CameraDescription camera;
  @override
  State<CameraPageTab> createState() => _CameraPageTabState();
}

class _CameraPageTabState extends State<CameraPageTab> {
  late CameraController _controller;

  @override
  void initState() {
    super.initState();
    _controller = CameraController(
      widget.camera,
      ResolutionPreset.medium,
    );
    _controller.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CameraPreview(_controller),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
