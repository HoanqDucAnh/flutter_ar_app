import 'package:rive/rive.dart';

class RiveAsset {
  final String path;
  final String artboard;
  final String stateMachineName;
  final String title;
  final String smiName;
  late SMIBool? input;

  RiveAsset(
      {required this.path,
      required this.artboard,
      required this.stateMachineName,
      required this.title,
      required this.smiName,
      this.input});

  set setInput(SMIBool value) {
    input = value;
  }
}
