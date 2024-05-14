import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import '../shared.dart';

@LazySingleton()
class AppTheme {
  final AppColors appColors;

  AppTheme(this.appColors);

  ThemeData get themeData => ThemeData(
      primaryColor: appColors.primaryColor,
      appBarTheme: AppBarTheme(
        color: appColors.primaryColor,
        elevation: 0,
        iconTheme: IconThemeData(color: appColors.secondaryColor),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        elevation: 0,
      ),
      colorScheme: ColorScheme(
        primary: appColors.onPrimaryColor,
        onPrimary: appColors.onPrimaryColor,
        primaryContainer: appColors.primaryColor,
        secondary: appColors.secondaryColor,
        onSecondary: appColors.onSecondaryColor,
        error: appColors.errorColor,
        onError: appColors.onErrorColor,
        background: appColors.backgroundColor,
        onBackground: appColors.onBackgroundColor,
        surface: appColors.surfaceColor,
        onSurface: appColors.onSecondaryColor,
        brightness: Brightness.light,
      ));
}
