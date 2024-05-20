import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_ar_app/core/initializer/app_initializer.dart';
import 'package:flutter_ar_app/shared/color/app_colors.dart';
import 'package:flutter_ar_app/shared/constant/device_dimen.dart';
import 'package:flutter_ar_app/shared/constant/layout_constant.dart';
import 'package:flutter_ar_app/shared/font/app_text_style.dart';
import 'package:flutter_ar_app/src/model/model.dart';

class CustomCard extends StatelessWidget {
  final MuseumArtifactModel exploreCard;

  const CustomCard({super.key, required this.exploreCard});

  @override
  Widget build(BuildContext context) {
    LayoutConstants layoutConstants = getIt<LayoutConstants>();
    AppColors appColors = getIt<AppColors>();
    AppTextStyle appTextStyle = getIt<AppTextStyle>();

    return Container(
      margin: layoutConstants.defaultMarginHorizontal,
      width: AppDimen.of(context).screenWidth * 0.6,
      decoration: BoxDecoration(
        borderRadius: layoutConstants.mediumBorderRadius,
      ),
      child: Stack(
        children: <Widget>[
          ClipRRect(
            borderRadius: layoutConstants.mediumBorderRadius,
            child: Image.asset(
              exploreCard.image,
              height: AppDimen.of(context).screenHeight * 0.4,
              width: double.maxFinite,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 8.0,
            left: 10.0,
            right: 10,
            child: Container(
              decoration: BoxDecoration(
                color: appColors.backgroundColor.withOpacity(0.8),
                borderRadius: layoutConstants.smallBorderRadius,
              ),
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    exploreCard.title,
                    style: appTextStyle.normalTextPrimary,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
