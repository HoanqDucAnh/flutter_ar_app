import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ar_app/core/initializer/app_initializer.dart';
import 'package:flutter_ar_app/core/router/app_router.dart';
import 'package:flutter_ar_app/shared/shared.dart';
import 'package:flutter_ar_app/src/view/shared_widget/widget/info_popup.dart';

class ExploreMore extends StatefulWidget {
  const ExploreMore({super.key});

  @override
  State<ExploreMore> createState() => _ExploreMoreState();
}

class _ExploreMoreState extends State<ExploreMore> {
  @override
  Widget build(BuildContext context) {
    final LayoutConstants layoutConstants = getIt<LayoutConstants>();
    final AppTextStyle appTextStyle = getIt<AppTextStyle>();
    final AppColors appColors = getIt<AppColors>();

    List<InfomationIcon> infomationIcons = [
      InfomationIcon(
          icon: Icons.map,
          title: 'Bản đồ',
          bgrColor: appColors.linearColorCyan,
          iconColor: appColors.linearColorCyanStronger,
          onPressed: () {
            AutoRouter.of(context).push(const MapRoute());
          },
          willNavigate: true),
      InfomationIcon(
        icon: Icons.location_on,
        title: 'Vị trí',
        bgrColor: appColors.linearColorGreen,
        iconColor: appColors.linearColorGreenStronger,
        onPressed: () {
          print('cliked');
        },
        willNavigate: true,
      ),
      InfomationIcon(
        icon: Icons.money,
        title: 'Vé và lệ phí',
        bgrColor: appColors.linearColorOrange,
        iconColor: appColors.linearColorOrangeStronger,
        willNavigate: false,
      ),
      InfomationIcon(
        icon: Icons.abc,
        title: 'Nội quy',
        bgrColor: appColors.linearColorPink,
        iconColor: appColors.linearColorPinkStronger,
        willNavigate: false,
      ),
      InfomationIcon(
        icon: Icons.access_time,
        title: 'Thời gian',
        bgrColor: appColors.linearColorPurple,
        iconColor: appColors.linearColorPurpleStronger,
        willNavigate: false,
      ),
      InfomationIcon(
        icon: Icons.phone,
        title: 'Liên hệ',
        bgrColor: appColors.linearColorRed,
        iconColor: appColors.linearColorRedStronger,
        willNavigate: false,
      ),
    ];

    return Container(
      padding: layoutConstants.headerPadding,
      height: AppDimen.of(context).screenHeight * 0.18,
      width: double.maxFinite,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          OverlayPortalController overlayPortalController =
              OverlayPortalController();
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(
                        horizontal: AppDimen.of(context).screenWidth * 0.05),
                    width: AppDimen.of(context).screenWidth * 0.2,
                    height: AppDimen.of(context).screenWidth * 0.2,
                    decoration: BoxDecoration(
                      color: infomationIcons[index].bgrColor.withOpacity(0.3),
                      borderRadius: layoutConstants.mediumBorderRadius,
                    ),
                    child: ClipRRect(
                      borderRadius: layoutConstants.smallBorderRadius,
                      child: InkWell(
                        onTap: () {
                          if (infomationIcons[index].willNavigate) {
                            infomationIcons[index].onPressed!();
                          } else {
                            overlayPortalController.show();
                          }
                        },
                        // child: const Image(
                        //   image: AssetImage(
                        //     'lib/core/resources/images/home_images/introduction.jpg',
                        //   ),
                        //   fit: BoxFit.cover,
                        // ),
                        child: Icon(
                          infomationIcons[index].icon,
                          color: infomationIcons[index].iconColor,
                          size: 50,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    infomationIcons[index].title,
                    style: appTextStyle.normalTextPrimary,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              OverlayPortal(
                controller: overlayPortalController,
                overlayChildBuilder: (context) {
                  return InfoPopup(
                    title: infomationIcons[index].title,
                    description: const Text('Description'),
                    overlayPortalController: overlayPortalController,
                  );
                },
              ),
            ],
          );
        },
        itemCount: infomationIcons.length,
        shrinkWrap: true,
      ),
    );

    // return SizedBox(
    //   height: AppDimen.of(context).screenHeight * 0.3,
    //   width: double.infinity,
    //   child: GridView.count(
    //     padding: const EdgeInsets.all(0),
    //     physics: const NeverScrollableScrollPhysics(),
    //     crossAxisCount: 3,
    //     childAspectRatio: 1.2,
    //     children: List.generate(infomationIcons.length, (index) {
    //       OverlayPortalController overlayPortalController =
    //           OverlayPortalController();
    //       return InkWell(
    //         onTap: () {
    //           if (infomationIcons[index].willNavigate) {
    //             infomationIcons[index].onPressed!();
    //           } else {
    //             overlayPortalController.show();
    //           }
    //         },
    //         child: Container(
    //           margin: const EdgeInsets.all(8.0),
    //           padding: const EdgeInsets.all(8.0),
    //           decoration: BoxDecoration(
    //             color: Colors.white,
    //             borderRadius: BorderRadius.circular(8.0),
    //           ),
    //           child: Column(
    //             mainAxisAlignment: MainAxisAlignment.start,
    //             children: [
    //               OverlayPortal(
    //                 controller: overlayPortalController,
    //                 overlayChildBuilder: (context) {
    //                   return InfoPopup(
    //                     title: infomationIcons[index].title,
    //                     description: const Text('Description'),
    //                     overlayPortalController: overlayPortalController,
    //                   );
    //                 },
    //               ),
    //               Text(
    //                 infomationIcons[index].title,
    //                 textAlign: TextAlign.center,
    //               ),
    //             ],
    //           ),
    //         ),
    //       );
    //     }).toList(),
    //   ),
    // );
  }
}

class InfomationIcon {
  final IconData icon;
  final String title;
  VoidCallback? onPressed;
  final bool willNavigate;
  final Color bgrColor;
  final Color iconColor;

  InfomationIcon(
      {required this.icon,
      required this.title,
      this.onPressed,
      required this.willNavigate,
      required this.bgrColor,
      required this.iconColor});
}
