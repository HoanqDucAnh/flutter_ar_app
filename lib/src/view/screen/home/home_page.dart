import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_ar_app/core/initializer/app_initializer.dart';
import 'package:flutter_ar_app/shared/shared.dart';
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
    final LayoutConstants layoutConstants = getIt<LayoutConstants>();
    final ScrollController scrollController = ScrollController();

    return Stack(
      children: [
        SingleChildScrollView(
          controller: scrollController,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: layoutConstants.headerPadding,
                child: Text(
                  'Chào mừng ',
                  style: appTextStyle.h1TextPrimary,
                ),
              ),
              Padding(
                padding: layoutConstants.headerPadding,
                child: Text(
                  'Nổi bật',
                  style: appTextStyle.h4TextPrimary,
                ),
              ),
              const HotSection(),
              Padding(
                padding: layoutConstants.headerPadding,
                child: Text(
                  'Giới thiệu',
                  style: appTextStyle.h4TextPrimary,
                ),
              ),
              //const IntroductionSection(),
              Padding(
                padding: layoutConstants.headerPadding,
                child: Text(
                  'Tin tức',
                  style: appTextStyle.h4TextPrimary,
                ),
              ),
              const InformationSection(),
            ],
          ),
        ),
        Positioned(
          right: 20,
          bottom: 20,
          child: ScrollAwareFloatingButton(
            scrollController: scrollController,
          ),
        ),
      ],
    );
  }
}
