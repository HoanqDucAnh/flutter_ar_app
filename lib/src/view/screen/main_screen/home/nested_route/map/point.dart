import 'package:flutter/material.dart';
import 'package:flutter_ar_app/src/view/screen/main_screen/home/nested_route/map/info_card.dart';
import 'package:flutter_ar_app/src/model/artifact.dart';

class Point extends StatelessWidget {
  static const buttonSize = 10.0;
  final OverlayPortalController _overlayPortalController =
      OverlayPortalController();
  final Artifact artifact;

  Point({super.key, required this.artifact});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: artifact.x,
      top: artifact.y,
      child: ElevatedButton(
        onPressed: () {
          _overlayPortalController.show();
        },
        style: ButtonStyle(
          minimumSize:
              MaterialStateProperty.all(const Size(buttonSize, buttonSize)),
          maximumSize:
              MaterialStateProperty.all(const Size(buttonSize, buttonSize)),
        ),
        child: OverlayPortal(
          controller: _overlayPortalController,
          overlayChildBuilder: (context) {
            return Stack(
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Opacity(
                    opacity: 0.5,
                    child: Container(
                      color: Colors.black,
                    ),
                  ),
                ),
                InfoCard(
                    overlayPortalController: _overlayPortalController,
                    artifact: artifact)
              ],
            );
          },
        ),
      ),
    );
  }
}
