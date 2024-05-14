import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ar_app/core/initializer/app_initializer.dart';
import 'package:flutter_ar_app/shared/color/app_colors.dart';
import 'package:flutter_ar_app/shared/font/app_text_style.dart';
import 'package:flutter_ar_app/shared/shared.dart';

@RoutePage()
class DetailPageTab extends StatefulWidget {
  const DetailPageTab({super.key});

  @override
  State<DetailPageTab> createState() => _DetailPageTabState();
}

class _DetailPageTabState extends State<DetailPageTab> {
  LayoutConstants layoutConstants = getIt<LayoutConstants>();
  AppColors appColors = getIt<AppColors>();
  AppTextStyle appTextStyle = getIt<AppTextStyle>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: AppDimen.of(context).screenHeight * 0.4,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                        'lib/core/resources/images/home_images/introduction.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              left: AppDimen.of(context).screenWidth * 0.05,
              top: AppDimen.of(context).screenHeight * 0.05,
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      AutoRouter.of(context).back();
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: appColors.iconColor,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: AppDimen.of(context).screenHeight * 0.30,
              child: Container(
                padding: layoutConstants.headerPadding,
                width: AppDimen.of(context).screenWidth,
                height: AppDimen.of(context).screenHeight * 0.7,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: layoutConstants.largeRadius,
                    topRight: layoutConstants.largeRadius,
                  ),
                  color: appColors.backgroundColor,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Introduction',
                      style: appTextStyle.h1TextPrimary,
                    ),
                    SizedBox(height: AppDimen.of(context).screenHeight * 0.003),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: appColors.iconColor,
                        ),
                        Text(
                          'Location: ',
                          style: appTextStyle.normalTextPrimary,
                        ),
                      ],
                    ),
                    SizedBox(height: AppDimen.of(context).screenHeight * 0.003),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
