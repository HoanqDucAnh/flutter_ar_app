import 'dart:core';

class Artifact {
  final double x;
  final double y;
  final String imageSrc;
  final String name;
  final List<String> introductions;

  const Artifact({
    required this.x,
    required this.y,
    required this.imageSrc,
    required this.name,
    required this.introductions,
  });
}