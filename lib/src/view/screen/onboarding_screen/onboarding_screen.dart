import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: 3,
        itemBuilder: (context, index) {
          return Container(
            width: double.maxFinite,
            height: double.maxFinite,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'lib/core/resources/images/home_images/introduction.jpg',
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome to',
                        style: appTextStyle.h1TextPrimary,
                      ),
                      Text(
                        'Flutter AR App',
                        style: appTextStyle.h1TextPrimary,
                      ),
                      SizedBox(
                        width: AppDimen.of(context).screenWidth * 0.65,
                        child: Text(
                          'lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                          style: appTextStyle.normalTextPrimary,
                        ),
                      ),
                      index == 2
                          ? ResponsiveButton(
                              text: 'Get Started',
                              onPressed: () {
                                AutoRouter.of(context)
                                    .navigate(const MainRoute());
                              },
                            )
                          : Container()
                    ],
                  ),
                  Column(
                    children: List.generate(
                      3,
                      (indexDots) {
                        return Container(
                          margin: const EdgeInsets.only(bottom: 2),
                          width: 8,
                          height: index == indexDots ? 25 : 8,
                          decoration: BoxDecoration(
                            borderRadius: layoutConstants.smallBorderRadius,
                            color: index == indexDots
                                ? appColors.secondaryColor
                                : appColors.secondaryColor.withOpacity(0.3),
                          ),
                        );
                      },
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
