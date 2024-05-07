import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ar_app/core/router/app_router.dart';
import 'package:flutter_masonry_view/flutter_masonry_view.dart';

class ExploreList extends StatelessWidget {
  const ExploreList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<String> items = [
      'lib/core/resources/images/museum_welcome_images/welcome1.jpg',
      'lib/core/resources/images/museum_welcome_images/welcome2.jpg',
      'lib/core/resources/images/museum_welcome_images/welcome3.jpg',
      'lib/core/resources/images/museum_welcome_images/welcome4.jpg',
      'lib/core/resources/images/museum_welcome_images/welcome5.jpg',
    ];
    return MasonryView(
      listOfItem: items,
      numberOfColumn: 2,
      itemBuilder: (item) => InkWell(
          onTap: () => AutoRouter.of(context).push(
                const CameraRouteTab(),
              ),
          child: Image.asset(item, fit: BoxFit.cover)),
    );
  }
}
