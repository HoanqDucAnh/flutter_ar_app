import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_ar_app/core/initializer/app_initializer.dart';
import 'package:flutter_ar_app/src/model/artifact.dart';
import 'package:flutter_ar_app/shared/shared.dart';

import 'package:flutter_ar_app/src/view/screen/main_screen/home/nested_route/map/point.dart';

@RoutePage()
class MapPage extends StatefulWidget {
  final List<Artifact> artifacts = const [
    Artifact(
        name: 'Artifact 1',
        introductions: ['Introduction 1', 'Introduction 2'],
        imageSrc:
            'https://media.macphun.com/img/uploads/customer/how-to/579/15531840725c93b5489d84e9.43781620.jpg?q=85&w=1340',
        x: 100,
        y: 100),
    Artifact(
        name: 'Artifact 2',
        introductions: ['Introduction 1', 'Introduction 2'],
        imageSrc:
            'https://media.macphun.com/img/uploads/customer/how-to/579/15531840725c93b5489d84e9.43781620.jpg?q=85&w=1340',
        x: 200,
        y: 200),
    Artifact(
        name: 'Artifact 3',
        introductions: ['Introduction 1', 'Introduction 2'],
        imageSrc:
            'https://media.macphun.com/img/uploads/customer/how-to/579/15531840725c93b5489d84e9.43781620.jpg?q=85&w=1340',
        x: 300,
        y: 300),
  ];

  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final AppColors appColors = getIt<AppColors>();
  final LayoutConstants layoutConstants = getIt<LayoutConstants>();
  final AppTextStyle appTextStyle = getIt<AppTextStyle>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Bản đồ bảo tàng',
          style: appTextStyle.h3TextPrimary,
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: appColors.textPrimaryColor,
          ),
          onPressed: () {
            context.router.back();
          },
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.info,
              color: appColors.textPrimaryColor,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          InteractiveViewer(
            maxScale: 2,
            child: Stack(
              children: [
                Image.asset(
                  'lib/core/resources/images/map_images/main_map.png',
                  width: double.maxFinite,
                  height: AppDimen.of(context).screenHeight * 0.45,
                  fit: BoxFit.fill,
                ),

                // for (Artifact artifact in widget.artifacts)
                //   Point(artifact: artifact)
              ],
            ),
          ),
          Padding(
            padding: layoutConstants.defaultMarginHorizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: AppDimen.of(context).screenWidth * 0.45,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      buildInfoText('Nhà trưng bày chính', '1.'),
                      buildInfoText('Sưu tập hiện vật tên lửa', '2.'),
                      buildInfoText('Sưu tập hiện vật máy bay', '3.'),
                      buildInfoText('Sưu tập hiện vật máy bay', '4.'),
                      buildInfoText('Sưu tập hiện vật trực thăng MI.6', '5.'),
                      buildInfoText('Sưu tập hiện vật máy bay', '6.'),
                    ],
                  ),
                ),
                SizedBox(
                  width: AppDimen.of(context).screenWidth * 0.45,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildInfoText('Sưu tập hiện vật Rađa', '7.'),
                      buildInfoText('Sưu tập hiện vật Rađa', '8.'),
                      buildInfoText('Hiện vật máy bay MI.4', '9.'),
                      buildInfoText('Sưu tập hiện vật máy bay', '10.'),
                      buildInfoText('Sưu tập hiện vật pháo cao xạ', '11.'),
                      buildInfoText('Hiện vật máy bay Pháp - Mỹ', '12.'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildInfoText(String text, String index) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(index, style: appTextStyle.normalTextPrimary),
          const SizedBox(width: 5),
          Flexible(
            child: Text(
              text,
              style: appTextStyle.normalTextPrimary,
            ),
          ),
        ],
      ),
    );
  }
}
