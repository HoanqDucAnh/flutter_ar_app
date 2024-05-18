import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_ar_app/core/initializer/app_initializer.dart';
import 'package:flutter_ar_app/shared/constant/layout_constant.dart';
import 'package:flutter_ar_app/shared/font/app_text_style.dart';
import 'package:flutter_ar_app/src/bloc/content_bloc/content_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widget/widget.dart';

@RoutePage()
class ExplorePageTab extends StatefulWidget {
  const ExplorePageTab({super.key});

  @override
  State<ExplorePageTab> createState() => _ExplorePageTabState();
}

class _ExplorePageTabState extends State<ExplorePageTab> {
  String selectedPill = 'Tất cả';
  late ContentBloc contentBloc;

  void _handlePillChange(String pill) {
    setState(() {
      selectedPill = pill;
    });
  }

  @override
  Widget build(BuildContext context) {
    LayoutConstants layoutConstants = getIt<LayoutConstants>();
    AppTextStyle appTextStyle = getIt<AppTextStyle>();

    return BlocProvider(
      create: (context) {
        contentBloc = ContentBloc();
        contentBloc.add(const ContentFetched(category: ContentCategory.all));
        return contentBloc;
      },
      child: Column(
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
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  PillButton(
                    text: 'Tất cả',
                    isSelected: selectedPill == 'Tất cả',
                    onPressed: () {
                      _handlePillChange('Tất cả');
                      contentBloc.add(
                          const ContentFetched(category: ContentCategory.all));
                    },
                  ),
                  PillButton(
                    text: 'Địa điểm',
                    isSelected: selectedPill == 'Địa điểm',
                    onPressed: () {
                      _handlePillChange('Địa điểm');
                      contentBloc.add(const ContentFetched(
                          category: ContentCategory.location));
                    },
                  ),
                  PillButton(
                    text: 'Máy bay',
                    isSelected: selectedPill == 'Máy bay',
                    onPressed: () {
                      _handlePillChange('Máy bay');
                      contentBloc.add(const ContentFetched(
                          category: ContentCategory.plane));
                    },
                  ),
                  PillButton(
                    text: 'Vũ khí',
                    isSelected: selectedPill == 'Vũ khí',
                    onPressed: () {
                      _handlePillChange('Vũ khí');
                      contentBloc.add(const ContentFetched(
                          category: ContentCategory.weapon));
                    },
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: layoutConstants.headerPadding,
            child: Text('Khám phá', style: appTextStyle.h3TextPrimary),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: BlocBuilder<ContentBloc, ContentState>(
                builder: (context, state) {
                  if (state.status == ContentStatus.loading ||
                      state.status == ContentStatus.initial) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state.status == ContentStatus.failure) {
                    return const Center(
                      child: Text('Failed to fetch content'),
                    );
                  } else if (state.status == ContentStatus.success) {
                    return ExploreList(artifactsList: state.artifacts!);
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
