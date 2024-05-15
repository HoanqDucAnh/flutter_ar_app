import 'package:flutter/material.dart';
import 'package:flutter_ar_app/core/initializer/app_initializer.dart';
import 'package:flutter_ar_app/shared/shared.dart';

class PillButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onPressed;

  const PillButton({
    super.key,
    required this.text,
    required this.isSelected,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    AppColors appColors = getIt<AppColors>();
    LayoutConstants layoutConstants = getIt<LayoutConstants>();

    return GestureDetector(
      onTap: onPressed,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: layoutConstants.headerPadding,
        decoration: BoxDecoration(
          color: isSelected
              ? appColors.linearColorPurple
              : appColors.secondaryColor,
          borderRadius: layoutConstants.mediumBorderRadius,
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isSelected
                ? appColors.textPrimaryColor
                : appColors.textSecondaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
