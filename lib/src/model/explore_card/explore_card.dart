import 'package:flutter_ar_app/src/bloc/content_bloc/content_bloc.dart';

class MuseumArtifactModel {
  final String title;
  final ContentCategory type;
  final String subtitle;
  final String image;
  final List<String> description;
  final String? manufacturer;
  final WeaponType? weaponType;
  final List<String>? contentImg;
  final String? modelUrl;
  final String? question;
  final String? answer1;
  final String? result1;
  final String? answer2;
  final String? result2;
  final double? scale;

  MuseumArtifactModel({
    required this.title,
    required this.subtitle,
    required this.type,
    required this.image,
    required this.description,
    this.contentImg,
    this.weaponType,
    this.manufacturer,
    this.modelUrl,
    this.question,
    this.answer1,
    this.result1,
    this.answer2,
    this.result2,
    this.scale,
  });
}

enum WeaponType { artillery, radar, missile, tank, aircraft }
