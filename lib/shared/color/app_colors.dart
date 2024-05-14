import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class AppColors {
  // Primary & secondary color
  Color get primaryColor => const Color(0xFFECEFF4);
  Color primaryColorWithOpacity(double opacity) =>
      primaryColor.withOpacity(opacity);
  Color get secondaryColor => const Color(0xFF6272A4);
  Color secondaryColorWithOpacity(double opacity) =>
      secondaryColor.withOpacity(opacity);

  // Text color
  Color get textPrimaryColor => const Color(0xFF44475A);
  Color textPrimaryColorWithOpacity(double opacity) =>
      textPrimaryColor.withOpacity(opacity);
  Color get textSecondaryColor => const Color(0xFFD8DEE9);
  Color textSecondaryColorWithOpacity(double opacity) =>
      textSecondaryColor.withOpacity(opacity);

  // Linear color
  Color get linearColorCyan => const Color(0xFF8be9fd);
  Color get linearColorGreen => const Color(0xFF50FA7B);
  Color get linearColorOrange => const Color(0xFFFFB86C);
  Color get linearColorPink => const Color(0xFFFF79C6);
  Color get linearColorPurple => const Color(0xFFBD93F9);
  Color get linearColorRed => const Color(0xFFFF5555);
  Color get linearColorYellow => const Color(0xFFF1FA8C);

  // Linear color but stronger
  Color get linearColorCyanStronger => const Color.fromARGB(255, 0, 174, 255);
  Color get linearColorGreenStronger => const Color.fromARGB(255, 26, 255, 0);
  Color get linearColorOrangeStronger => const Color(0xFFFFA500);
  Color get linearColorPinkStronger => const Color(0xFFFF1493);
  Color get linearColorPurpleStronger => const Color(0xFF8A2BE2);
  Color get linearColorRedStronger => const Color(0xFFFF0000);
  Color get linearColorYellowStronger => const Color(0xFFFFFF00);

  //Icon color
  Color get iconColor => const Color(0xFFBD93F9);

  // On select color
  Color get onSelectColor => const Color(0xFF393b3b);

  // Additional colors for ColorScheme
  Color get onPrimaryColor => const Color(0xFF6272A4);
  Color get onSecondaryColor => const Color(0xFFECEFF4);
  Color get errorColor => const Color(0xFFFF5555);
  Color get onErrorColor => const Color(0xFFB00020);
  Color get backgroundColor => const Color(0xFFECEFF4);
  Color get onBackgroundColor => const Color(0xFF282A36);
  Color get surfaceColor => const Color(0xFFECEFF4);
  Color get onSurfaceColor => const Color(0xFF393b3b);
}
