import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_ar_app/core/initializer/app_initializer.dart';
import 'package:flutter_ar_app/core/router/app_router.dart';
import 'package:flutter_ar_app/shared/font/app_text_style.dart';
import 'package:get_it/get_it.dart';
import '../../shared_widget/shared_widget.dart';
import './widget/widget.dart';

@RoutePage()
class HomePageTab extends StatefulWidget {
  const HomePageTab({super.key});

  @override
  State<HomePageTab> createState() => _HomePageTabState();
}

class _HomePageTabState extends State<HomePageTab> {
  @override
  Widget build(BuildContext context) {
    final AppTextStyle appTextStyle = getIt<AppTextStyle>();

    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
            child: Text(
              'Chào mừng ',
              style: appTextStyle.h1TextPrimary,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
            child: Text(
              'Nổi bật',
              style: appTextStyle.h4TextPrimary,
            ),
          ),
          const HotSection(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
            child: Text(
              'Giới thiệu',
              style: appTextStyle.h4TextPrimary,
            ),
          ),
          const IntroductionSection(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
            child: Text(
              'Tin tức',
              style: appTextStyle.h4TextPrimary,
            ),
          ),
          const InformationSection(),
        ],
      ),
    );
  }
}
