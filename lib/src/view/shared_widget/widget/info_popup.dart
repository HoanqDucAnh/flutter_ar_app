import 'package:flutter/material.dart';

class InfoPopup extends StatelessWidget {
  final String? imgUrl;
  final String title;
  final Widget description;
  final OverlayPortalController overlayPortalController;
  const InfoPopup(
      {super.key,
      this.imgUrl,
      required this.title,
      required this.description,
      required this.overlayPortalController});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 150),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Column(
          children: <Widget>[
            imgUrl != null
                ? Container(
                    margin: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: Image.network(imgUrl!),
                    ),
                  )
                : Container(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      description,
                    ],
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                overlayPortalController.hide();
              },
              child: const Text('Close'),
            ),
          ],
        ),
      ),
    );
  }
}
