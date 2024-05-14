import 'package:flutter/material.dart';
import 'package:flutter_ar_app/core/initializer/app_initializer.dart';
import 'package:flutter_ar_app/shared/color/app_colors.dart';
import 'package:flutter_ar_app/shared/constant/device_dimen.dart';
import 'package:flutter_ar_app/shared/constant/layout_constant.dart';
import 'package:flutter_ar_app/shared/font/app_text_style.dart';
import 'package:flutter_ar_app/src/model/model.dart';

class CustomCard extends StatelessWidget {
  final ExploreCard exploreCard;

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
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 8.0,
            left: 10.0,
            right: 10,
            child: Container(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    exploreCard.title,
                    style: appTextStyle.s14w400TextPrimary,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        color: appColors.iconColor,
                        size: 16,
                      ),
                      Text(
                        exploreCard.subtitle,
                        style: appTextStyle.s12w400TextPrimary,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
