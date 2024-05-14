import 'package:flutter/material.dart';
import 'package:flutter_ar_app/core/initializer/app_initializer.dart';
import 'package:flutter_ar_app/shared/shared.dart';

class ResponsiveButton extends StatelessWidget {
  bool? isResponsive;
  double? width;
  String? text;
  VoidCallback onPressed;

  ResponsiveButton(
      {super.key,
      this.isResponsive = false,
      this.width,
      this.text,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    AppColors appColors = getIt<AppColors>();
    LayoutConstants layoutConstants = getIt<LayoutConstants>();
    AppTextStyle appTextStyle = getIt<AppTextStyle>();

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: AppDimen.of(context).screenHeight * 0.08,
        decoration: BoxDecoration(
          color: appColors.secondaryColor,
          borderRadius: layoutConstants.smallBorderRadius,
        ),
        child: Row(
          children: [
            text != null
                ? Text(
                    text!,
                    style: appTextStyle.h4TextPrimary,
                  )
                : Container(),
            Icon(
              Icons.arrow_back,
              color: appColors.iconColor,
            ),
          ],
        ),
      ),
    );
  }
}
