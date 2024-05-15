import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ar_app/core/initializer/app_initializer.dart';
import 'package:flutter_ar_app/shared/shared.dart';
import 'package:flutter_ar_app/src/bloc/content_bloc/content_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widget/widget.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final AppTextStyle appTextStyle = getIt<AppTextStyle>();
    final LayoutConstants layoutConstants = getIt<LayoutConstants>();
    final AppColors appColors = getIt<AppColors>();

    return BlocProvider(
      create: (BuildContext context) => ContentBloc(),
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: layoutConstants.headerPadding,
              child: Text(
                'Khám phá',
                style: appTextStyle.h1TextPrimary,
              ),
            ),
            const DiscoverTabbar(),
            Padding(
              padding: const EdgeInsets.only(
                  top: 20, bottom: 10, left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Thông tin',
                    style: appTextStyle.h4TextPrimary,
                  ),
                  Tooltip(
                    triggerMode: TooltipTriggerMode.tap,
                    waitDuration: const Duration(milliseconds: 10),
                    showDuration: const Duration(milliseconds: 300),
                    message: 'Trượt để xem thêm',
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: appColors.iconColor,
                    ),
                  ),
                ],
              ),
            ),
            const ExploreMore()
          ],
        ),
      ),
    );
  }
}
