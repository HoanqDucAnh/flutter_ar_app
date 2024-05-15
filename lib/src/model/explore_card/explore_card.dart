import 'package:flutter_ar_app/src/bloc/content_bloc/content_bloc.dart';

class MuseumArtifactModel {
  final String title;
  final ContentCategory type;
  final String subtitle;
  final String image;
  final List<String> description;
  final String? manufacturer;

  MuseumArtifactModel({
    required this.title,
    required this.subtitle,
    required this.type,
    required this.image,
    required this.description,
    this.manufacturer,
  });
}
