import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ar_app/core/initializer/app_initializer.dart';
import 'package:flutter_ar_app/core/router/app_router.dart';
import 'package:flutter_ar_app/shared/color/app_colors.dart';
import 'package:flutter_ar_app/shared/constant/device_dimen.dart';
import 'package:flutter_ar_app/shared/constant/layout_constant.dart';
import 'package:flutter_ar_app/src/bloc/content_bloc/content_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widget.dart';

class DiscoverTabbar extends StatefulWidget {
  const DiscoverTabbar({super.key});

  @override
  State<DiscoverTabbar> createState() => _DiscoverTabbarState();
}

class _DiscoverTabbarState extends State<DiscoverTabbar>
    with TickerProviderStateMixin {
  late TabController tabController;
  late ContentBloc contentBloc;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
    tabController.addListener(_handleTabChange);
    contentBloc = BlocProvider.of<ContentBloc>(context);
    contentBloc.add(const ContentFetched(category: ContentCategory.location));
  }

  void _handleTabChange() {
    if (tabController.indexIsChanging) {
      switch (tabController.index) {
        case 0:
          contentBloc
              .add(const ContentFetched(category: ContentCategory.location));
          break;
        case 1:
          contentBloc
              .add(const ContentFetched(category: ContentCategory.plane));
          break;
        case 2:
          contentBloc
              .add(const ContentFetched(category: ContentCategory.weapon));
          break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
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
                BlocBuilder<ContentBloc, ContentState>(
                  builder: (context, state) {
                    return _buildContent(state, context);
                  },
                ),
                BlocBuilder<ContentBloc, ContentState>(
                  builder: (context, state) {
                    return _buildContent(state, context);
                  },
                ),
                BlocBuilder<ContentBloc, ContentState>(
                  builder: (context, state) {
                    return _buildContent(state, context);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContent(ContentState state, BuildContext context) {
    if (state.status == ContentStatus.loading ||
        state.status == ContentStatus.initial) {
      return const CircularProgressIndicator();
    } else if (state.status == ContentStatus.success) {
      // ignore: prefer_is_empty
      if (state.artifacts!.length == 0) {
        return const Text('No data', style: TextStyle(color: Colors.black));
      }
      return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: state.artifacts!.length > 5 ? 5 : state.artifacts!.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              AutoRouter.of(context)
                  .push(DetailRouteTab(exploreCard: state.artifacts![index]));
            },
            child: CustomCard(
              exploreCard: state.artifacts![index],
            ),
          );
        },
      );
    } else {
      return Text('Error: ${state.error}',
          style: const TextStyle(color: Colors.red));
    }
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
