import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ar_app/core/initializer/app_initializer.dart';
import 'package:flutter_ar_app/core/router/app_router.dart';
import 'package:flutter_ar_app/shared/shared.dart';
import 'package:flutter_ar_app/src/bloc/content_bloc/content_bloc.dart';
import 'package:flutter_ar_app/src/model/explore_card/explore_card.dart';
import 'package:flutter_masonry_view/flutter_masonry_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
  }

  Future<void> addToFavorite(SharedPreferences prefs) async {
    try {
      List<String> favoriteList = prefs.getStringList('myFavourite') ?? [];
      //check if the item is already in the favorite list
      if (favoriteList.contains(widget.exploreCard.title)) {
        //throw an error if the item is already in the favorite list
        throw Exception('Đã có trong danh sách yêu thích');
      }
      favoriteList.add(widget.exploreCard.title);
      await prefs.setStringList('myFavourite', favoriteList);
      setState(() {
        isFavorite = true;
      });
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            duration: const Duration(seconds: 1),
            content: Text(
              'Đã thêm ${widget.exploreCard.title} vào yêu thích',
              style: appTextStyle.normalTextPrimary,
            ),
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            duration: const Duration(seconds: 1),
            content: Text(
              'Đã có lỗi xảy ra ${e.toString()}',
              style: appTextStyle.normalTextPrimary,
            ),
          ),
        );
      }
    }
  }

  Future<void> removeFromFavorite(SharedPreferences prefs) async {
    try {
      List<String> favoriteList = prefs.getStringList('myFavourite') ?? [];
      //check if the item is already in the favorite list
      if (!favoriteList.contains(widget.exploreCard.title)) {
        //throw an error if the item is not in the favorite list
        throw Exception('Không có trong danh sách yêu thích');
      }
      favoriteList.remove(widget.exploreCard.title);
      await prefs.setStringList('myFavourite', favoriteList);
      setState(() {
        isFavorite = false;
      });
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            duration: const Duration(seconds: 1),
            content: Text(
              'Đã xóa ${widget.exploreCard.title} khỏi yêu thích',
              style: appTextStyle.normalTextPrimary,
            ),
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            duration: const Duration(seconds: 1),
            content: Text(
              'Đã có lỗi xảy ra ${e.toString()}',
              style: appTextStyle.normalTextPrimary,
            ),
          ),
        );
      }
    }
  }

  bool checkIfFavorite(SharedPreferences prefs) {
    List<String> favoriteList = prefs.getStringList('myFavourite') ?? [];
    if (favoriteList.contains(widget.exploreCard.title)) {
      isFavorite = true;
    }
    return isFavorite;
  }

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
        currentWeekday != 6 && hour >= 8 && hour <= 11 ||
        hour >= 13 && hour <= 16;
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
                      AutoRouter.of(context).maybePop();
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
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
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
                            height: AppDimen.of(context).screenHeight * 0.005),
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
                            Expanded(
                              child: Container(),
                            ),
                            FutureBuilder(
                              future: SharedPreferences.getInstance(),
                              builder: (context, snapshot) {
                                if (snapshot.hasData &&
                                    snapshot.connectionState ==
                                        ConnectionState.done) {
                                  SharedPreferences prefs = snapshot.data!;
                                  isFavorite = checkIfFavorite(prefs);
                                  return Padding(
                                    padding: const EdgeInsets.only(right: 16.0),
                                    child: InkWell(
                                      onTap: () async {
                                        if (isFavorite) {
                                          await removeFromFavorite(prefs);
                                        } else {
                                          await addToFavorite(prefs);
                                        }
                                      },
                                      child: Icon(
                                        isFavorite
                                            ? Icons.favorite
                                            : Icons.favorite_border,
                                        color: appColors.linearColorRed,
                                      ),
                                    ),
                                  );
                                } else {
                                  return Container();
                                }
                              },
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
                                textAlign: TextAlign.justify,
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
                                  return ClipRRect(
                                    borderRadius:
                                        layoutConstants.mediumBorderRadius,
                                    child: Image.asset(
                                      item,
                                      fit: BoxFit.cover,
                                    ),
                                  );
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
                        onTap: () {
                          if (widget.exploreCard.modelUrl == null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Không có mô hình 3D cho máy bay này',
                                  style: appTextStyle.normalTextPrimary,
                                ),
                              ),
                            );
                            return;
                          }
                          AutoRouter.of(context).push(
                            CameraRouteTab(artifact: widget.exploreCard),
                          );
                        },
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
