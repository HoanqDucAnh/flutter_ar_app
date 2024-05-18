import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_ar_app/core/initializer/app_initializer.dart';
import 'package:flutter_ar_app/shared/color/app_colors.dart';
import 'package:flutter_ar_app/shared/font/app_text_style.dart';
import 'package:flutter_ar_app/shared/shared.dart';
import 'package:flutter_ar_app/src/bloc/content_bloc/content_bloc.dart';
import 'package:flutter_ar_app/src/model/explore_card/explore_card.dart';
import 'package:flutter_masonry_view/flutter_masonry_view.dart';

@RoutePage()
class DetailPageTab extends StatefulWidget {
  final MuseumArtifactModel exploreCard;
  const DetailPageTab({super.key, required this.exploreCard});

  @override
  State<DetailPageTab> createState() => _DetailPageTabState();
}

class _DetailPageTabState extends State<DetailPageTab> {
  LayoutConstants layoutConstants = getIt<LayoutConstants>();
  AppColors appColors = getIt<AppColors>();
  AppTextStyle appTextStyle = getIt<AppTextStyle>();

  Stream<DateTime> timeStream() async* {
    yield DateTime.now();
    while (true) {
      await Future.delayed(const Duration(minutes: 1));
      yield DateTime.now();
    }
  }

  bool checkOpenTime(DateTime now) {
    int hour = now.hour;
    int currentWeekday = now.weekday;
    // The museum is open from 8 AM to 5 PM.
    return hour >= 8 && hour <= 11 ||
        hour >= 13 && hour <= 16 ||
        currentWeekday != 6;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: AppDimen.of(context).screenHeight * 0.4,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(widget.exploreCard.image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              left: AppDimen.of(context).screenWidth * 0.05,
              top: AppDimen.of(context).screenHeight * 0.05,
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      AutoRouter.of(context).back();
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: appColors.iconColor,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: AppDimen.of(context).screenHeight * 0.35,
              child: SizedBox(
                height: AppDimen.of(context).screenHeight * 0.65,
                child: SingleChildScrollView(
                  child: Container(
                    padding: layoutConstants.headerPadding,
                    width: AppDimen.of(context).screenWidth,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: layoutConstants.largeRadius,
                        topRight: layoutConstants.largeRadius,
                      ),
                      color: appColors.backgroundColor,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.exploreCard.title,
                          style: appTextStyle.h2TextPrimary,
                        ),
                        SizedBox(
                            height: AppDimen.of(context).screenHeight * 0.003),
                        widget.exploreCard.type == ContentCategory.location
                            ? Row(
                                children: [
                                  Icon(
                                    Icons.location_on,
                                    color: appColors.secondaryColor,
                                    size: 20,
                                  ),
                                  const SizedBox(width: 3),
                                  Text(
                                    'Địa điểm: ${widget.exploreCard.manufacturer}',
                                    style: appTextStyle.subTitleTextPrimary,
                                    softWrap: true,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Expanded(child: Container()),
                                  StreamBuilder<DateTime>(
                                    stream: timeStream(),
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData) {
                                        DateTime now = snapshot.data!;
                                        bool isOpen = checkOpenTime(now);
                                        return _buildCurrentStatusButton(
                                            isOpen);
                                      } else {
                                        return const CircularProgressIndicator();
                                      }
                                    },
                                  ),
                                ],
                              )
                            : Row(
                                children: [
                                  Icon(
                                    Icons.settings,
                                    color: appColors.secondaryColor,
                                    size: 20,
                                  ),
                                  const SizedBox(width: 3),
                                  Text(
                                    'Sản xuất bởi: ${widget.exploreCard.manufacturer}',
                                    style: appTextStyle.subTitleTextPrimary,
                                    softWrap: true,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                        SizedBox(
                            height: AppDimen.of(context).screenHeight * 0.003),
                        Row(
                          children: [
                            Wrap(
                              children: List.generate(
                                5,
                                (index) => Icon(
                                  Icons.star,
                                  color: index == 4
                                      ? appColors.secondaryColor
                                      : appColors.linearColorOrange,
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              '(4.0)',
                              style: appTextStyle.normalTextPrimary,
                            ),
                          ],
                        ),
                        SizedBox(
                            height: AppDimen.of(context).screenHeight * 0.03),
                        Text(
                          'Mô tả',
                          style: appTextStyle.h4TextPrimary,
                        ),
                        SizedBox(
                            height: AppDimen.of(context).screenHeight * 0.01),
                        ...List.generate(widget.exploreCard.description.length,
                            (index) {
                          return Column(
                            children: [
                              Text(
                                widget.exploreCard.description[index],
                                style: appTextStyle.normalTextPrimary,
                              ),
                              const SizedBox(height: 5),
                            ],
                          );
                        }),
                        SizedBox(
                            height: AppDimen.of(context).screenHeight * 0.03),
                        widget.exploreCard.contentImg != null
                            ? MasonryView(
                                listOfItem: widget.exploreCard.contentImg!,
                                numberOfColumn:
                                    widget.exploreCard.contentImg!.length > 1
                                        ? 2
                                        : 1,
                                itemPadding: 8.0,
                                itemRadius: 10,
                                itemBuilder: (dynamic item) {
                                  return FutureBuilder(
                                      future: precacheImage(
                                          AssetImage(item), context),
                                      builder: (context, snapshot) {
                                        if (snapshot.connectionState !=
                                            ConnectionState.done) {
                                          return Container(
                                            width: AppDimen.of(context)
                                                    .screenWidth *
                                                0.8,
                                            height: AppDimen.of(context)
                                                    .screenWidth *
                                                0.8,
                                            color: appColors.secondaryColor,
                                            child: const Center(
                                              child: CircularProgressIndicator(
                                                color: Colors.white,
                                              ),
                                            ),
                                          );
                                        }
                                        return ClipRRect(
                                          borderRadius: layoutConstants
                                              .mediumBorderRadius,
                                          child: Image.asset(
                                            item,
                                            fit: BoxFit.cover,
                                          ),
                                        );
                                      });
                                },
                              )
                            : Container(),
                        SizedBox(
                            height: AppDimen.of(context).screenHeight * 0.08),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: SizedBox(
                width: AppDimen.of(context).screenWidth,
                height: AppDimen.of(context).screenHeight * 0.06,
                // decoration: BoxDecoration(
                //   color: appColors.linearColorPurple,
                //   borderRadius: BorderRadius.only(
                //     topLeft: layoutConstants.largeRadius,
                //     topRight: layoutConstants.largeRadius,
                //   ),
                // ),
                child: widget.exploreCard.type == ContentCategory.plane
                    ? InkWell(
                        child: Container(
                          width: AppDimen.of(context).screenWidth * 0.45,
                          padding: layoutConstants.headerPadding,
                          decoration: BoxDecoration(
                            color: appColors.linearColorGreen,
                            borderRadius: layoutConstants.smallBorderRadius,
                          ),
                          child: Center(
                            child: Text(
                              'Xem máy bay',
                              style: appTextStyle.normalTextPrimary,
                            ),
                          ),
                        ),
                        onTap: () {},
                      )
                    : Container(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCurrentStatusButton(bool isOpen) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: isOpen ? appColors.linearColorGreen : appColors.linearColorRed,
        borderRadius: layoutConstants.smallBorderRadius,
      ),
      child: Text(
        isOpen ? 'Mở cửa' : 'Đang đóng',
        style: isOpen
            ? appTextStyle.normalTextPrimary
            : appTextStyle.normalTextSecondary,
      ),
    );
  }
}
