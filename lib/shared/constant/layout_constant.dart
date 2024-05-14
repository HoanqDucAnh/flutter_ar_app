import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
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

  //padding
  EdgeInsets get defaultPaddingAll => const EdgeInsets.all(defaultPadding);
  EdgeInsets get defaultPaddingHorizontal =>
      const EdgeInsets.symmetric(horizontal: defaultPadding);
  EdgeInsets get defaultPaddingVertical =>
      const EdgeInsets.symmetric(vertical: defaultPadding);
  EdgeInsets get paddingAppBar => const EdgeInsets.only(top: 30, left: 4);

  //margin
  EdgeInsets get defaultMarginAll => const EdgeInsets.all(defaultMargin);
  EdgeInsets get defaultMarginHorizontal =>
      const EdgeInsets.symmetric(horizontal: defaultMargin);
  EdgeInsets get defaultMarginVertical =>
      const EdgeInsets.symmetric(vertical: defaultMargin);
  EdgeInsets get marginAllBottombar => const EdgeInsets.all(6);

  BorderRadius get smallBorderRadius => BorderRadius.circular(8.0);
  BorderRadius get mediumBorderRadius => BorderRadius.circular(20.0);
  BorderRadius get bottomNavBarRadius => BorderRadius.circular(24.0);
  BorderRadius get largeBorderRadius => BorderRadius.circular(30.0);

  //Radius
  Radius get smallRadius => const Radius.circular(10);
  Radius get mediumRadius => const Radius.circular(20);
  Radius get largeRadius => const Radius.circular(30);
}
