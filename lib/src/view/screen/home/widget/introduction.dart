import 'package:flutter/material.dart';
import 'package:flutter_ar_app/shared/constant/device_dimen.dart';

class IntroductionSection extends StatelessWidget {
  const IntroductionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: AppDimen.of(context).screenWidth,
        height: AppDimen.of(context).screenHeight * 0.5,
        child: SafeArea(
          child: Image.asset(
              'lib/core/resourses/images/home_images/introduction.JPG'),
        ),
      ),
    );
  }
}
