import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class AppColors {
  // Primary & secondary color
  Color get primaryColor => const Color(0xFFECE4D0);
  Color get secondaryColor => const Color(0xFFFFCD00);

  // Text color
  Color get textPrimaryColor => const Color(0xFF393b3b);
  Color get textSecondaryColor => const Color(0xFFDAC0A3);

  // Linear color
  Color get linearColor1 => const Color(0xFFFFCD00);
  Color get linearColor2 => const Color(0xFF102C57);

  // On select color
  Color get onSelectColor => const Color(0xFF393b3b);

  // Additional colors for ColorScheme
  Color get onPrimaryColor => const Color(0xFF393b3b);
  Color get onSecondaryColor => const Color(0xFF393b3b);
  Color get errorColor => const Color(0xFFB00020);
  Color get onErrorColor => const Color(0xFFB00020);
  Color get backgroundColor => const Color(0xFFECE4D0);
  Color get onBackgroundColor => const Color(0xFF102C57);
  Color get surfaceColor => const Color(0xFFECE4D0);
  Color get onSurfaceColor => const Color(0xFF393b3b);
}
