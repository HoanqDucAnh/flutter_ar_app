import 'package:flutter/material.dart';
import 'package:flutter_ar_app/core/initializer/app_initializer.dart';
import 'package:flutter_ar_app/shared/constant/layout_constant.dart';
import 'package:flutter_ar_app/shared/shared.dart';

class HotSection extends StatefulWidget {
  const HotSection({super.key});

  @override
  State<HotSection> createState() => _HotSectionState();
}

class _HotSectionState extends State<HotSection> {
  @override
  Widget build(BuildContext context) {
    final AppColors appColors = getIt<AppColors>();
    final AppTextStyle appTextStyle = getIt<AppTextStyle>();
    final LayoutConstants layoutConstants = getIt<LayoutConstants>();

    return Container(
      padding: layoutConstants.headerPadding,
      height: AppDimen.of(context).screenHeight * 0.4,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5, // Set this to the number of items you have
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(
              left: index == 0 ? 0 : 8.0, // No left margin for the first item
              right: index == 4 ? 0 : 8.0, // No right margin for the last item
              top: 8.0,
              bottom: 8.0,
            ),
            width: AppDimen.of(context).screenWidth * 0.7,
            decoration: BoxDecoration(
              borderRadius: layoutConstants.mediumBorderRadius,
            ),
            child: Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: layoutConstants.mediumBorderRadius,
                  child: Image.asset(
                    'lib/core/resources/images/museum_welcome_images/welcome${index + 1}.jpg',
                    height: AppDimen.of(context).screenHeight * 0.4,
                    width: AppDimen.of(context).screenWidth * 0.7,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 8.0,
                  left: 10.0,
                  right: 10,
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: appColors.primaryColor.withOpacity(0.8),
                      borderRadius: layoutConstants.smallBorderRadius,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Column(
                          children: [
                            Text(
                              'Tên địa điểm',
                              style: appTextStyle.s14w400TextPrimary,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.location_on,
                                  color: appColors.secondaryColor,
                                  size: 16,
                                ),
                                Text(
                                  'Hanoi, Vietnam',
                                  style: appTextStyle.s12w400TextPrimary,
                                ),
                              ],
                            )
                          ],
                        ),
                        TextButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                              appColors.secondaryColor,
                            ),
                          ),
                          onPressed: () {},
                          child: Row(
                            mainAxisSize: MainAxisSize
                                .min, // Set the main size of the row to the minimum
                            children: [
                              Text(
                                'Chi tiết ',
                                style: appTextStyle.s12w400TextPrimary,
                              ),
                              Icon(
                                Icons.arrow_forward_outlined,
                                size: 16,
                                color: appColors.textPrimaryColor,
                              ), // Add the arrow icon
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
