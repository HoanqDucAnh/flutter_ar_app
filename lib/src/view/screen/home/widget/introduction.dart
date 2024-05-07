import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_ar_app/core/initializer/app_initializer.dart';
import 'package:flutter_ar_app/shared/constant/device_dimen.dart';
import 'package:flutter_ar_app/shared/font/app_text_style.dart';

import '../../../../../shared/constant/layout_constant.dart';

class IntroductionSection extends StatelessWidget {
  const IntroductionSection({super.key});

  @override
  Widget build(BuildContext context) {
    final LayoutConstants layoutConstants = getIt<LayoutConstants>();
    final AppTextStyle appTextStyle = getIt<AppTextStyle>();
    final List<String> introImages = [
      'lib/core/resources/images/museum_welcome_images/welcome1.jpg',
      'lib/core/resources/images/museum_welcome_images/welcome2.jpg',
      'lib/core/resources/images/museum_welcome_images/welcome3.jpg',
      'lib/core/resources/images/museum_welcome_images/welcome4.jpg',
      'lib/core/resources/images/museum_welcome_images/welcome5.jpg',
    ];

    final PageController pageController = PageController();

    return Center(
      child: Container(
        padding: layoutConstants.defaultPaddingHorizontal,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: AppDimen.of(context).screenHeight * 0.3,
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: layoutConstants.smallBorderRadius,
                    child: PageView.builder(
                      controller: pageController,
                      itemCount: introImages.length,
                      itemBuilder: (context, index) {
                        return Image.asset(
                          width: AppDimen.of(context).screenWidth,
                          height: AppDimen.of(context).screenHeight * 0.3,
                          introImages[index],
                          fit: BoxFit.cover,
                        );
                      },
                    ),
                  ),
                  Positioned(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back),
                        onPressed: () {
                          if (pageController.hasClients &&
                              pageController.page != null &&
                              pageController.page! > 0) {
                            pageController.previousPage(
                              duration: const Duration(milliseconds: 400),
                              curve: Curves.easeInOut,
                            );
                          }
                        },
                      ),
                    ),
                  ),
                  Positioned(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                        icon: const Icon(Icons.arrow_forward),
                        onPressed: () {
                          if (pageController.hasClients &&
                              pageController.page != null) {
                            if (pageController.page! >=
                                introImages.length - 1) {
                              pageController.animateToPage(
                                0,
                                duration: const Duration(milliseconds: 400),
                                curve: Curves.easeInOut,
                              );
                            } else {
                              pageController.nextPage(
                                duration: const Duration(milliseconds: 400),
                                curve: Curves.easeInOut,
                              );
                            }
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: layoutConstants.defaultPaddingVertical,
              child: Text(
                'Bảo tàng triển lãm về không quân Việt Nam, có hơn 3.000 hiện vật, tranh ảnh và bên ngoài có máy bay.',
                style: appTextStyle.normalTextPrimary,
                textAlign: TextAlign.justify,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Giá vé:',
                      style: appTextStyle.normalTextPrimary,
                    ),
                    Text(
                      'Miễn phí',
                      style: appTextStyle.normalTextPrimary,
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Giờ mở cửa:',
                      style: appTextStyle.normalTextPrimary,
                    ),
                    Text(
                      '8:00 - 16:00',
                      style: appTextStyle.normalTextPrimary,
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: layoutConstants.defaultPaddingVertical,
              child: Text(
                'Địa chỉ: 173C Đ. Trường Chinh, Khương Mai, Thanh Xuân, Hà Nội, Việt Nam',
                style: appTextStyle.normalTextPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
