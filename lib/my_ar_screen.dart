import 'dart:math' as math;
import 'package:arkit_plugin/arkit_plugin.dart';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

// class MyApp extends StatelessWidget {
//   final String url1 = 'models.scnassets/spaceship.dae';
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(

//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: MyHomePage(),
//     );
//   }
// }

class MyARScreen extends StatefulWidget {
  @override
  State<MyARScreen> createState() => _MyARScreenState();
}

class _MyARScreenState extends State<MyARScreen> {
  late ARKitController arkitController;
  ARKitReferenceNode? node;
  ARKitReferenceNode? node1;
  // ARKitSphere? sphere;
  // ARKitSphere? sphere1;
  ARKitText? question;
  // ARKitText? answer1;
  // ARKitText? answer2;

  @override
  void dispose() {
    arkitController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ARKitSceneView(
      showFeaturePoints: true,
      planeDetection: ARPlaneDetection.horizontal,
      enableTapRecognizer: true,
      onARKitViewCreated: onARKitViewCreated
    );
  }
  // => Scaffold(
  //     appBar: AppBar(
  //       title: const Text('ARKit in Flutter'),
  //     ),
  //     body: Container(
  //       child: ARKitSceneView(
  //         // showFeaturePoints: true,
  //         enableTapRecognizer: true,
  //         // planeDetection: ARPlaneDetection.horizontal,
  //         onARKitViewCreated: onARKitViewCreated,
  //       ),
  //     )
  //   );

  void onARKitViewCreated(ARKitController arkitController) {
    this.arkitController = arkitController;
    arkitController.addCoachingOverlay(CoachingOverlayGoal.horizontalPlane);
    arkitController.onAddNodeForAnchor = _handleAddAnchor;
    // arkitController.onUpdateNodeForAnchor = _handleUpdateAnchor;
    arkitController.add(_createQuestion());
    arkitController.add(_createAnswer());
    arkitController.add(_createAnswer2());
    // arkitController.add(_createSphere());
    arkitController.onNodeTap = (nodes) => _handleNodeTap(nodes);
    // arkitController.onNodeTap = (nodes) => onNodeTapHandler(nodes);
  }

  void _handleAddAnchor(ARKitAnchor anchor) {
    if (anchor is ARKitPlaneAnchor) {
      _addPlane(arkitController, anchor);
    }
  }

  // void _handleUpdateAnchor(ARKitAnchor anchor) {
  //   if (anchor.identifier != anchorId || anchor is! ARKitPlaneAnchor) {
  //     return;
  //   }
  //   node?.position = vector.Vector3(anchor.center.x, 0, anchor.center.z);
  //   plane?.width.value = anchor.extent.x;
  //   plane?.height.value = anchor.extent.z;
  // }

  ARKitNode _createQuestion() {
    final text = ARKitText(
      text: 'What is the color of this plane ?',
      extrusionDepth: 1,
      materials: [
        ARKitMaterial(
          diffuse: ARKitMaterialProperty.color(Colors.blue),
        )
      ],
    );
    return ARKitNode(
      name: 'TextNode',
      geometry: text,
      position: vector.Vector3(-0.3, 0.3, -1.4),
      scale: vector.Vector3(0.02, 0.02, 0.02),
    );
  }

  ARKitNode _createAnswer() {
    final text = ARKitText(
      text: 'White',
      extrusionDepth: 1,
      materials: [
        ARKitMaterial(
          diffuse: ARKitMaterialProperty.color(Colors.white),
        )
      ],
    );
    return ARKitNode(
      name: 'TrueNode',
      geometry: text,
      position: vector.Vector3(-0.3, 0, -1.4),
      scale: vector.Vector3(0.02, 0.02, 0.02),
    );
  }

  ARKitNode _createAnswer2() {
    final text = ARKitText(
      text: 'Green',
      extrusionDepth: 1,
      materials: [
        ARKitMaterial(
          diffuse: ARKitMaterialProperty.color(Colors.green),
        )
      ],
    );
    return ARKitNode(
      name: 'FalseNode',
      geometry: text,
      position: vector.Vector3(1, 0, -1.4),
      scale: vector.Vector3(0.02, 0.02, 0.02),
    );
  }

  void _handleNodeTap(List<String> nodeNames) {
  if (nodeNames.contains('TrueNode')) {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) =>
        const AlertDialog(content: Text('Correct')),
    );
    }
  else if (nodeNames.contains('FalseNode')) {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) =>
        const AlertDialog(content: Text('Incorrect')),
    );
    }
  }

  void _addPlane(ARKitController controller, ARKitPlaneAnchor anchor) {
    if (node != null && node1 != null) {
      controller.remove(node!.name);
      // controller.remove(node1!.name);
    }
    node = ARKitReferenceNode(
      url: 'models.scnassets/combatplane.dae',
      position: vector.Vector3(0, 0, 0),
      scale: vector.Vector3.all(0.03),
    );
    // node1 = ARKitReferenceNode(
    //   url: 'models.scnassets/dash.dae',
    //   scale: vector.Vector3.all(0.3),
    //   position: vector.Vector3(0, 0, -1.0)
    // );
    controller.add(node!, parentNodeName: anchor.nodeName);
    // controller.add(node1!, parentNodeName: anchor.nodeName);
  }

  void onNodeTapHandler(List<String> nodesList) {
    final name = nodesList.first;
    showDialog<void>(
      context: context,
      builder: (BuildContext context) =>
          AlertDialog(content: Text('You tapped on $name')),
    );
  }

}
