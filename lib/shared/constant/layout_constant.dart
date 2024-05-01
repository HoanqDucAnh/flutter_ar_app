import 'package:injectable/injectable.dart';
import 'package:flutter/material.dart';

@LazySingleton()
class LayoutConstants {
  LayoutConstants();

  static const double defaultPadding = 16.0;
  static const double defaultMargin = 16.0;
  static const double defaultBorderRadius = 8.0;

  EdgeInsets get headerPadding =>
      const EdgeInsets.symmetric(horizontal: 16, vertical: 5);

  BorderRadius get smallBorderRadius => BorderRadius.circular(8.0);
  BorderRadius get mediumBorderRadius => BorderRadius.circular(20.0);
  BorderRadius get largeBorderRadius => BorderRadius.circular(30.0);
}
