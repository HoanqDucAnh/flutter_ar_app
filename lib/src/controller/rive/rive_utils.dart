import 'package:rive/rive.dart';

class RiveUtils {
  static StateMachineController getRiveController(Artboard artboard,
      {stateMachineName = 'State Machine 1'}) {
    StateMachineController? stateMachineController =
        StateMachineController.fromArtboard(artboard, stateMachineName);
    artboard.addController(stateMachineController!);
    return stateMachineController;
  }
}
