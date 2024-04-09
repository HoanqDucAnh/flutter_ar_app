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
        ),
      );
}
