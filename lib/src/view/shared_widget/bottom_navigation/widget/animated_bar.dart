import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_ar_app/shared/shared.dart';
import 'package:flutter_ar_app/src/model/model.dart';

class AnimatedBar extends StatelessWidget {
  const AnimatedBar({
    super.key,
    required this.selectedNavItem,
    required this.appColors,
    required this.layoutConstants,
    required this.isSelected,
  });

  final RiveAsset selectedNavItem;
  final AppColors appColors;
  final LayoutConstants layoutConstants;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      height: 4,
      width: isSelected ? 20 : 0,
      decoration: BoxDecoration(
          color: appColors.onSelectColor,
          borderRadius: layoutConstants.smallBorderRadius),
    );
  }
}
