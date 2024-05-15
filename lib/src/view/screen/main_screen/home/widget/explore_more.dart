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
        description: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 16,
            ),
            RichText(
              text: TextSpan(
                style: appTextStyle.normalTextPrimary,
                children: [
                  TextSpan(
                    text: 'Trẻ dưới 6 tuổi',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: appColors.linearColorOrangeStronger),
                  ),
                  const TextSpan(text: ': 2.000 VND/vé'),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            RichText(
              text: TextSpan(
                style: appTextStyle.normalTextPrimary,
                children: <TextSpan>[
                  TextSpan(
                    text: 'Trẻ từ 6 tuổi trở lên',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: appColors.linearColorOrangeStronger),
                  ),
                  const TextSpan(text: ': 5.000 VND/vé'),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            RichText(
              text: TextSpan(
                style: appTextStyle.normalTextPrimary,
                children: <TextSpan>[
                  TextSpan(
                    text: 'Người lớn',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: appColors.linearColorOrangeStronger),
                  ),
                  const TextSpan(text: ': 10.000 VND/vé'),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            RichText(
              text: TextSpan(
                style: appTextStyle.normalTextPrimary,
                children: <TextSpan>[
                  TextSpan(
                    text: 'Du khách nước ngoài',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: appColors.linearColorOrangeStronger),
                  ),
                  const TextSpan(text: ': 30.000 VND/vé'),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            RichText(
              text: TextSpan(
                style: appTextStyle.normalTextPrimary,
                children: <TextSpan>[
                  TextSpan(
                    text: 'Phí gửi xe',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: appColors.linearColorOrangeStronger),
                  ),
                  const TextSpan(text: ': 3.000 VND/xe máy, 20.000 VND/xe hơi'),
                ],
              ),
            ),
          ],
        ),
        willNavigate: false,
      ),
      InfomationIcon(
        icon: Icons.abc,
        title: 'Lưu ý',
        bgrColor: appColors.linearColorPink,
        iconColor: appColors.linearColorPinkStronger,
        description: Column(
          children: [
            const SizedBox(
              height: 16,
            ),
            RichText(
              text: TextSpan(
                children: [
                  const WidgetSpan(
                    child: Icon(Icons.circle, size: 6, color: Colors.black),
                    alignment: PlaceholderAlignment.middle,
                  ),
                  TextSpan(
                    text: ' Trông chừng trẻ nhỏ tránh hỏng hiện vật',
                    style: appTextStyle.normalTextPrimary,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            RichText(
              text: TextSpan(
                children: [
                  const WidgetSpan(
                    child: Icon(Icons.circle, size: 6, color: Colors.black),
                    alignment: PlaceholderAlignment.middle,
                  ),
                  TextSpan(
                    text: ' Chọn trang phục thoải mái và đi giày thể thao',
                    style: appTextStyle.normalTextPrimary,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            RichText(
              text: TextSpan(
                children: [
                  const WidgetSpan(
                    child: Icon(Icons.circle, size: 6, color: Colors.black),
                    alignment: PlaceholderAlignment.middle,
                  ),
                  TextSpan(
                    text: ' Được mang quạt cầm tay, đồ ăn nhẹ và nước uống',
                    style: appTextStyle.normalTextPrimary,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            RichText(
              text: TextSpan(
                children: [
                  const WidgetSpan(
                    child: Icon(Icons.circle, size: 6, color: Colors.black),
                    alignment: PlaceholderAlignment.middle,
                  ),
                  TextSpan(
                    text:
                        ' Hãy ưu tiên tham quan các cuộc triển lãm trong nhà trước. Các cuộc triển lãm ngoài trời vẫn mở cửa, kể cả sau giờ làm việc trong nhà',
                    style: appTextStyle.normalTextPrimary,
                  ),
                ],
              ),
            ),
          ],
        ),
        willNavigate: false,
      ),
      InfomationIcon(
        icon: Icons.access_time,
        title: 'Thời gian',
        description: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 16,
            ),
            RichText(
              text: TextSpan(
                style: appTextStyle.normalTextPrimary,
                children: [
                  TextSpan(
                    text: 'Thứ 2',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: appColors.linearColorPurpleStronger,
                    ),
                  ),
                  const TextSpan(text: ': 8:00 - 11:00 | 13:00 - 16:00'),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            RichText(
              text: TextSpan(
                style: appTextStyle.normalTextPrimary,
                children: [
                  TextSpan(
                    text: 'Thứ 3',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: appColors.linearColorPurpleStronger),
                  ),
                  const TextSpan(text: ': 8:00 - 11:00 | 13:00 - 16:00'),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            RichText(
              text: TextSpan(
                style: appTextStyle.normalTextPrimary,
                children: [
                  TextSpan(
                    text: 'Thứ 4',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: appColors.linearColorPurpleStronger),
                  ),
                  const TextSpan(text: ': 8:00 - 11:00 | 13:00 - 16:00'),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            RichText(
              text: TextSpan(
                style: appTextStyle.normalTextPrimary,
                children: [
                  TextSpan(
                    text: 'Thứ 5',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: appColors.linearColorPurpleStronger),
                  ),
                  const TextSpan(text: ': 8:00 - 11:00 | 13:00 - 16:00'),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            RichText(
              text: TextSpan(
                style: appTextStyle.normalTextPrimary,
                children: [
                  TextSpan(
                    text: 'Thứ 6',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: appColors.linearColorPurpleStronger),
                  ),
                  const TextSpan(text: ': Chỉ phục vụ đoàn đăng ký trước'),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            RichText(
              text: TextSpan(
                style: appTextStyle.normalTextPrimary,
                children: [
                  TextSpan(
                    text: 'Thứ 7',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: appColors.linearColorPurpleStronger),
                  ),
                  const TextSpan(text: ': 16:00 - 18:30'),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            RichText(
              text: TextSpan(
                style: appTextStyle.normalTextPrimary,
                children: [
                  TextSpan(
                    text: 'Chủ nhật',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: appColors.linearColorPurpleStronger),
                  ),
                  const TextSpan(text: ': 16:00 - 18:30'),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            RichText(
              text: TextSpan(
                style: appTextStyle.normalTextPrimary,
                children: [
                  TextSpan(
                    text: 'Ngày lễ',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: appColors.linearColorPurpleStronger),
                  ),
                  const TextSpan(text: ': 16:00 - 18:30'),
                ],
              ),
            ),
          ],
        ),
        bgrColor: appColors.linearColorPurple,
        iconColor: appColors.linearColorPurpleStronger,
        willNavigate: false,
      ),
      InfomationIcon(
        icon: Icons.phone,
        title: 'Liên hệ',
        bgrColor: appColors.linearColorRed,
        iconColor: appColors.linearColorRedStronger,
        description: Expanded(
          child: Center(
            child: Text(
              'Hotline: 069562323',
              style: appTextStyle.normalTextPrimary,
            ),
          ),
        ),
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
                    overlayPortalController: overlayPortalController,
                    bgrColor: infomationIcons[index].bgrColor,
                    description: infomationIcons[index].description,
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
  }
}

class InfomationIcon {
  final IconData icon;
  final String title;
  VoidCallback? onPressed;
  final bool willNavigate;
  final Color bgrColor;
  final Color iconColor;
  final Widget? description;

  InfomationIcon(
      {required this.icon,
      required this.title,
      this.onPressed,
      required this.willNavigate,
      required this.bgrColor,
      required this.iconColor,
      this.description});
}
