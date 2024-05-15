import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ar_app/core/initializer/app_initializer.dart';
import 'package:flutter_ar_app/core/resources/content/plane/plane_list.dart';
import 'package:flutter_ar_app/core/router/app_router.dart';
import 'package:flutter_ar_app/shared/font/app_text_style.dart';
import 'package:flutter_masonry_view/flutter_masonry_view.dart';
import 'package:flutter_ar_app/src/model/model.dart';

class ExploreList extends StatelessWidget {
  final List<MuseumArtifactModel> artifactsList;
  const ExploreList({
    required this.artifactsList,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final AppTextStyle appTextStyle = getIt<AppTextStyle>();

    if (artifactsList.isEmpty) {
      return const Center(
        child: Text('Empty'),
      );
    }
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.only(bottom: 20.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: MasonryView(
            listOfItem: artifactsList.map((e) => e.title).toList(),
            numberOfColumn: 2,
            itemBuilder: (item) => Container(
              margin: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: InkWell(
                onTap: () => AutoRouter.of(context).push(
                  const CameraRouteTab(),
                ),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        artifactsList
                            .elementAt(artifactsList
                                .indexWhere((element) => element.title == item))
                            .image,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      bottom: 8.0,
                      left: 10.0,
                      right: 10,
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item,
                              style: appTextStyle.s14w400TextPrimary,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
