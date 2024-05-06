import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_ar_app/core/initializer/app_initializer.dart';
import 'package:flutter_ar_app/core/router/app_router.dart';
import 'package:flutter_ar_app/shared/constant/layout_constant.dart';
import 'package:flutter_ar_app/shared/font/app_text_style.dart';
import './widget/widget.dart';

@RoutePage()
class ExplorePageTab extends StatefulWidget {
  const ExplorePageTab({super.key});

  @override
  State<ExplorePageTab> createState() => _ExplorePageTabState();
}

class _ExplorePageTabState extends State<ExplorePageTab> {
  @override
  Widget build(BuildContext context) {
    LayoutConstants layoutConstants = getIt<LayoutConstants>();
    AppTextStyle appTextStyle = getIt<AppTextStyle>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: layoutConstants.headerPadding,
          child: Text(
            'Thể loại',
            style: appTextStyle.h3TextPrimary,
          ),
        ),
        Padding(
          padding: layoutConstants.headerPadding,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              PillButton(text: 'Tất cả', isSelected: false, onPressed: () {}),
              PillButton(text: 'Máy bay', isSelected: true, onPressed: () {}),
              PillButton(
                  text: 'Trực thăng', isSelected: false, onPressed: () {}),
            ],
          ),
        ),
        Padding(
          padding: layoutConstants.headerPadding,
          child: Text('Khám phá', style: appTextStyle.h3TextPrimary),
        ),
        const Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: ExploreList(),
          ),
        ),
      ],
    );
  }
}
