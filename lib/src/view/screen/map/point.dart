import 'package:flutter/material.dart';
import 'package:flutter_ar_app/src/view/screen/map/info_panel.dart';

class Point extends StatelessWidget {
  final double x;
  final double y;
  static const buttonSize = 10.0;
  final OverlayPortalController _overlayPortalController = OverlayPortalController();

  Point({
    super.key,
    required this.x,
    required this.y,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: x,
      top: y,
      child: ElevatedButton(
        onPressed: () {
          _overlayPortalController.show();
        },
        style: ButtonStyle(
          minimumSize: MaterialStateProperty.all(const Size(buttonSize, buttonSize)),
          maximumSize: MaterialStateProperty.all(const Size(buttonSize, buttonSize)),
        ),
        child: OverlayPortal(
          controller: _overlayPortalController,
          overlayChildBuilder: (context) {
            return Stack(
              children: [
                GestureDetector(
                  onTap: () {}, // Absorb all taps
                  child: Opacity(
                    opacity: 0.5,
                    child: Container(
                      color: Colors.black,
                    ),
                  ),
                ),
                Info(
                  overlayPortalController: _overlayPortalController
                )
              ]
            );
          }
        )
      )
    );
  }
}