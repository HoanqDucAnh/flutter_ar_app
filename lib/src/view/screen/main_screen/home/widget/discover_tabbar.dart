import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ar_app/core/initializer/app_initializer.dart';
import 'package:flutter_ar_app/core/router/app_router.dart';
import 'package:flutter_ar_app/shared/color/app_colors.dart';
import 'package:flutter_ar_app/shared/constant/device_dimen.dart';
import 'package:flutter_ar_app/shared/constant/layout_constant.dart';
import 'package:flutter_ar_app/src/model/model.dart';
import 'widget.dart';

class DiscoverTabbar extends StatefulWidget {
  const DiscoverTabbar({super.key});

  @override
  State<DiscoverTabbar> createState() => _DiscoverTabbarState();
}

class _DiscoverTabbarState extends State<DiscoverTabbar>
    with TickerProviderStateMixin {
  List<ExploreCard> exploreCards = [
    ExploreCard(
      title: 'Tất cả',
      subtitle: 'Tất cả sản phẩm',
      description: 'Tất cả sản phẩm',
      image: 'lib/core/resources/images/home_images/introduction.jpg',
    ),
    ExploreCard(
      title: 'Mới nhất',
      subtitle: 'Mới nhất',
      description: 'Mới nhất',
      image: 'lib/core/resources/images/home_images/introduction.jpg',
    ),
    ExploreCard(
      title: 'Phổ biến',
      subtitle: 'Phổ biến',
      description: 'Phổ biến',
      image: 'lib/core/resources/images/home_images/introduction.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 3, vsync: this);
    AppColors appColors = getIt<AppColors>();
    LayoutConstants layoutConstants = getIt<LayoutConstants>();

    return Padding(
      padding: const EdgeInsets.only(top: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 0, bottom: 20),
            child: Align(
              alignment: Alignment.centerLeft,
              child: TabBar(
                tabAlignment: TabAlignment.start,
                labelPadding: const EdgeInsets.only(right: 16, left: 16),
                controller: tabController,
                labelColor: appColors.textPrimaryColor,
                unselectedLabelColor:
                    appColors.textPrimaryColor.withOpacity(0.2),
                isScrollable: true,
                indicatorSize: TabBarIndicatorSize.label,
                indicator: CircularTabIndicator(
                  color: appColors.textPrimaryColor,
                  radius: 3,
                ),
                tabs: const [
                  Tab(
                    text: 'Khu trưng bày',
                  ),
                  Tab(
                    text: 'Máy bay',
                  ),
                  Tab(
                    text: 'Khí tài khác',
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: AppDimen.of(context).screenHeight * 0.35,
            width: double.infinity,
            child: TabBarView(
              controller: tabController,
              children: [
                ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: exploreCards.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        AutoRouter.of(context).push(const DetailRouteTab());
                      },
                      child: CustomCard(
                        exploreCard: exploreCards[index],
                      ),
                    );
                  },
                ),
                const Text('Mới nhất'),
                const Text('Phổ biến'),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CircularTabIndicator extends Decoration {
  final Color color;
  final double radius;

  const CircularTabIndicator({required this.color, required this.radius});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CirclePainter(color: color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter {
  final double radius;
  final Color color;

  _CirclePainter({required this.color, required this.radius});

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint paint = Paint();
    paint.color = color;
    paint.isAntiAlias = true;

    final Offset circleOffset = offset +
        Offset(configuration.size!.width / 2,
            configuration.size!.height - 3 * radius);

    canvas.drawCircle(circleOffset, radius, paint);
  }
}
