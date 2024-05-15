import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_ar_app/core/initializer/app_initializer.dart';
import 'package:flutter_ar_app/shared/color/app_colors.dart';
import 'package:flutter_ar_app/shared/font/app_text_style.dart';

class InfoPopup extends StatelessWidget {
  final String? imgUrl;
  final String title;
  final Widget? description;
  final Color bgrColor;
  final OverlayPortalController overlayPortalController;
  const InfoPopup(
      {super.key,
      this.imgUrl,
      required this.title,
      this.description,
      required this.overlayPortalController,
      required this.bgrColor});

  @override
  Widget build(BuildContext context) {
    final AppTextStyle appTextStyle = getIt<AppTextStyle>();
    final AppColors appColors = getIt<AppColors>();

    return Container(
      decoration: BoxDecoration(
        color: appColors.backgroundColor,
        borderRadius: BorderRadius.circular(15.0),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 150),
      child: Column(
        children: <Widget>[
          imgUrl != null
              ? Container(
                  margin: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: Image.network(imgUrl!),
                  ),
                )
              : Container(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: appTextStyle.h3TextPrimary),
                    description ?? const SizedBox(),
                  ],
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(bgrColor),
              ),
              onPressed: () {
                overlayPortalController.hide();
              },
              child: Text(
                'Đóng',
                style: appTextStyle.normalTextSecondary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
