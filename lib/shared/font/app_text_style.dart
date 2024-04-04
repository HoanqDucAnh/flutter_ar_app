import 'package:flutter/material.dart';
import '../shared.dart';
import 'package:injectable/injectable.dart';

/// AppTextStyle format as follows:
/// s[fontSize][fontWeight][Color]
/// Example: s18w400Primary

@LazySingleton()
class AppTextStyle {
  final AppColors _appColors;

  AppTextStyle(this._appColors);

  static const _defaultLetterSpacing = 0.03;

  static const _baseTextStyle = TextStyle(
    fontFamily: 'Averta',
    letterSpacing: _defaultLetterSpacing,
  );

  TextStyle get s12w400Primary => _baseTextStyle.copyWith(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: _appColors.primaryColor,
      );
}
