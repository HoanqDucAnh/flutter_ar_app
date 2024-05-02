import 'package:flutter/material.dart';

class Info extends StatelessWidget {
  final OverlayPortalController overlayPortalController;
  
  const Info({
    super.key,
    required this.overlayPortalController
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(50),
      color: Colors.blue,
      child: Center(
        child: Container(
          color: Colors.red,
          child: Column(
            children: [
              const Text("Artifact Info"),
              ElevatedButton(
                onPressed: () {
                  overlayPortalController.hide();
                },
                child: const Text("Close")
              )
            ],
          )
        )
      )
    );
  }
}
