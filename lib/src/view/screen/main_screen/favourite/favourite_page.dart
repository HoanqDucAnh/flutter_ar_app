import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ar_app/core/initializer/app_initializer.dart';
import 'package:flutter_ar_app/shared/constant/layout_constant.dart';
import 'package:flutter_ar_app/shared/font/app_text_style.dart';
import 'package:flutter_ar_app/src/bloc/bloc.dart';
import 'package:flutter_ar_app/src/bloc/content_bloc/content_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../explore/widget/widget.dart';

@RoutePage()
class FavouritePageTab extends StatefulWidget {
  const FavouritePageTab({super.key});

  @override
  State<FavouritePageTab> createState() => _FavouritePageTabState();
}

class _FavouritePageTabState extends State<FavouritePageTab> {
  String selectedPill = 'Tất cả';
  late FavouriteBloc favouriteBloc;

  @override
  void initState() {
    super.initState();
  }

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
        favouriteBloc = FavouriteBloc();
        favouriteBloc.add(const FavouriteInit());

        return favouriteBloc;
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: layoutConstants.headerPadding,
            child: Text(
              'Lọc theo',
              style: appTextStyle.h3TextPrimary,
            ),
          ),
          Padding(
            padding: layoutConstants.headerPadding,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  PillButton(
                    text: 'Tất cả',
                    isSelected: selectedPill == 'Tất cả',
                    onPressed: () {
                      _handlePillChange('Tất cả');
                      favouriteBloc.add(
                          const FavouriteLoad(category: ContentCategory.all));
                    },
                  ),
                  PillButton(
                    text: 'Địa điểm',
                    isSelected: selectedPill == 'Địa điểm',
                    onPressed: () {
                      _handlePillChange('Địa điểm');
                      favouriteBloc.add(const FavouriteLoad(
                          category: ContentCategory.location));
                    },
                  ),
                  PillButton(
                    text: 'Máy bay',
                    isSelected: selectedPill == 'Máy bay',
                    onPressed: () {
                      _handlePillChange('Máy bay');
                      favouriteBloc.add(
                          const FavouriteLoad(category: ContentCategory.plane));
                    },
                  ),
                  PillButton(
                    text: 'Vũ khí',
                    isSelected: selectedPill == 'Vũ khí',
                    onPressed: () {
                      _handlePillChange('Vũ khí');
                      favouriteBloc.add(const FavouriteLoad(
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
              child: BlocBuilder<FavouriteBloc, FavouriteState>(
                builder: (context, state) {
                  if (state.status == FavouriteStatus.loading ||
                      state.status == FavouriteStatus.initial) {
                    return Center(
                      child: Container(),
                    );
                  } else if (state.status == FavouriteStatus.failure) {
                    return const Center(
                      child: Text('Failed to fetch content'),
                    );
                  } else if (state.status == FavouriteStatus.success) {
                    return ExploreList(artifactsList: state.artifacts!);
                  }
                  return Center(
                    child: Container(),
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
