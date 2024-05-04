import 'package:flutter/material.dart';
import 'package:flutter_ar_app/src/model/artifact.dart';

class InfoCard extends StatelessWidget {
  final OverlayPortalController overlayPortalController;
  final String imageUrl = 'https://media.macphun.com/img/uploads/customer/how-to/579/15531840725c93b5489d84e9.43781620.jpg?q=85&w=1340';
  final String text = 'This is a test text';
  final Artifact artifact;
  
  const InfoCard({
    super.key,
    required this.overlayPortalController,
    required this.artifact
  });

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
            Container(
              margin: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image.network(artifact.imageSrc),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Text>[
                      Text(
                        artifact.name,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      for (String introduction in artifact.introductions)
                        Text(introduction),
                    ]
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
