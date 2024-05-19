import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_ar_app/core/initializer/app_initializer.dart';
import 'package:flutter_ar_app/core/router/router.dart';
import 'package:flutter_ar_app/shared/shared.dart';
import 'package:flutter_ar_app/src/view/shared_widget/shared_widget.dart';

@RoutePage()
class OnboardingPageTab extends StatefulWidget {
  const OnboardingPageTab({super.key});

  @override
  State<OnboardingPageTab> createState() => _OnboardingPageTabState();
}

class _OnboardingPageTabState extends State<OnboardingPageTab> {
  AppTextStyle appTextStyle = getIt<AppTextStyle>();
  LayoutConstants layoutConstants = getIt<LayoutConstants>();
  AppColors appColors = getIt<AppColors>();

  List<String> onboardingImages = [
    'lib/core/resources/images/onboarding_images/1.jpg',
    'lib/core/resources/images/onboarding_images/2.jpg',
    'lib/core/resources/images/onboarding_images/3.jpg',
  ];

  List<String> onboardingTexts = [
    'Khám phá di sản lịch sử - Bước vào thế giới của Phòng không Không quân Việt Nam.',
    'Trải nghiệm số hóa - Tận hưởng trải nghiệm tương tác độc đáo với các triển lãm.',
    'Cập nhật không gian - Luôn cập nhật với các sự kiện và hoạt động sắp diễn ra.',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (context, index) {
          return Container(
            width: double.maxFinite,
            height: double.maxFinite,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  onboardingImages[index],
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              margin: EdgeInsets.only(
                top: AppDimen.of(context).screenHeight * 0.1,
                left: 20,
                right: 20,
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: index % 2 != 0
                        ? 0
                        : AppDimen.of(context).screenHeight * 0.5,
                    left: 0,
                    right: 0,
                    child: Column(
                      crossAxisAlignment: index == 0
                          ? CrossAxisAlignment.center
                          : CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Chào mừng đến với',
                          style: appTextStyle.h2TextPrimary,
                        ),
                        Text(
                          'Bảo tàng phòng không - không quân',
                          style: appTextStyle.h4TextPrimary,
                          softWrap: true,
                          maxLines: 2,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: AppDimen.of(context).screenHeight * 0.1,
                          child: Text(
                            onboardingTexts[index],
                            style: appTextStyle.normalTextPrimary,
                          ),
                        ),
                        index == 2
                            ? Center(
                                child: InkWell(
                                  onTap: () {
                                    AutoRouter.of(context)
                                        .navigate(const MainRoute());
                                  },
                                  child: Container(
                                    width:
                                        AppDimen.of(context).screenWidth * 0.3,
                                    height: AppDimen.of(context).screenHeight *
                                        0.05,
                                    decoration: BoxDecoration(
                                      color: appColors.secondaryColor,
                                      borderRadius:
                                          layoutConstants.smallBorderRadius,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Bắt đầu',
                                          style: appTextStyle.h4TextPrimary
                                              .copyWith(
                                            color: appColors.primaryColor,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Icon(
                                          Icons.arrow_forward,
                                          color: appColors.iconColor,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            : Container()
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    left: 0,
                    right: 0,
                    child: Column(
                      children: [
                        Text(
                          'Trượt để xem thêm',
                          style: appTextStyle.subTitleTextPrimary,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Icon(
                                Icons.arrow_back_ios,
                                color: appColors.linearColorRed,
                              ),
                            ),
                            Row(
                              children: List.generate(
                                3,
                                (indexDots) {
                                  return Container(
                                    margin: const EdgeInsets.only(bottom: 2),
                                    width: index == indexDots ? 25 : 8,
                                    height: 8,
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          layoutConstants.smallBorderRadius,
                                      color: index == indexDots
                                          ? appColors.linearColorRed
                                          : appColors.linearColorRed
                                              .withOpacity(0.3),
                                    ),
                                  );
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Icon(
                                Icons.arrow_forward_ios,
                                color: appColors.linearColorRed,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
