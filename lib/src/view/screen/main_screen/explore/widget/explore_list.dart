import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ar_app/core/initializer/app_initializer.dart';
import 'package:flutter_ar_app/core/router/app_router.dart';
import 'package:flutter_ar_app/core/router/router.dart';
import 'package:flutter_ar_app/shared/font/app_text_style.dart';
import 'package:flutter_ar_app/src/bloc/content_bloc/content_bloc.dart';
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
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          child: MasonryView(
            listOfItem: artifactsList.map((e) => e.title).toList(),
            numberOfColumn: 2,
            itemBuilder: (item) => Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: InkWell(
                onTap: () {
                  AutoRouter.of(context).push(DetailRouteTab(
                      exploreCard: artifactsList[artifactsList
                          .indexWhere((element) => element.title == item)]));
                },
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
                      child: Center(
                        child: Container(
                          padding: const EdgeInsets.all(4.0),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Text(
                            item,
                            style: appTextStyle.normalTextSecondary,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
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
