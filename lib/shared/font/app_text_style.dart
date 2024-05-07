import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
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

  //Heading
  TextStyle get h1TextPrimary => _baseTextStyle.copyWith(
        fontSize: 32,
        fontWeight: FontWeight.w700,
        color: _appColors.textPrimaryColor,
      );

  TextStyle get h2TextPrimary => _baseTextStyle.copyWith(
        fontSize: 24,
        fontWeight: FontWeight.w700,
        color: _appColors.textPrimaryColor,
      );

  TextStyle get h3TextPrimary => _baseTextStyle.copyWith(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        color: _appColors.textPrimaryColor,
      );

  TextStyle get h4TextPrimary => _baseTextStyle.copyWith(
        fontSize: 18,
        fontWeight: FontWeight.w700,
        color: _appColors.textPrimaryColor,
      );

  TextStyle get h5TextPrimary => _baseTextStyle.copyWith(
        fontSize: 16,
        fontWeight: FontWeight.w700,
        color: _appColors.textPrimaryColor,
      );

  //Normal Text
  TextStyle get normalTextPrimary => _baseTextStyle.copyWith(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: _appColors.textPrimaryColor,
      );
  TextStyle get normalTextSecondary => _baseTextStyle.copyWith(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: _appColors.primaryColor,
      );
  TextStyle get s12w400TextPrimary => s12TextPrimary(FontWeight.w400);
  TextStyle get s14w400TextPrimary => s14TextPrimary(FontWeight.w400);
  TextStyle get s16w400TextPrimary => s16TextPrimary(FontWeight.w400);

  TextStyle get s12w400TextSecondary => s12TextSecondary(FontWeight.w400);
  TextStyle get s14w400TextSecondary => s14TextSecondary(FontWeight.w400);
  TextStyle get s16w400TextSecondary => s16TextSecondary(FontWeight.w400);

  TextStyle s16TextPrimary(FontWeight fontWeight) => _baseTextStyle.copyWith(
        fontSize: 16,
        fontWeight: fontWeight,
        color: _appColors.textPrimaryColor,
      );

  TextStyle s12TextSecondary(FontWeight fontWeight) => _baseTextStyle.copyWith(
        fontSize: 12,
        fontWeight: fontWeight,
        color: _appColors.primaryColor,
      );

  TextStyle s14TextSecondary(FontWeight fontWeight) => _baseTextStyle.copyWith(
        fontSize: 14,
        fontWeight: fontWeight,
        color: _appColors.primaryColor,
      );

  TextStyle s16TextSecondary(FontWeight fontWeight) => _baseTextStyle.copyWith(
        fontSize: 16,
        fontWeight: fontWeight,
        color: _appColors.primaryColor,
      );

  TextStyle s12TextPrimary(FontWeight fontWeight) => _baseTextStyle.copyWith(
        fontSize: 12,
        fontWeight: fontWeight,
        color: _appColors.textPrimaryColor,
      );

  TextStyle s14TextPrimary(FontWeight fontWeight) => _baseTextStyle.copyWith(
        fontSize: 14,
        fontWeight: fontWeight,
        color: _appColors.textPrimaryColor,
      );
}
