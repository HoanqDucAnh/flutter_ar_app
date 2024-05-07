import 'package:flutter/material.dart';
import 'package:flutter_ar_app/core/initializer/app_initializer.dart';
import 'package:flutter_ar_app/shared/color/app_colors.dart';
import 'package:flutter_ar_app/shared/shared.dart';

class InformationSection extends StatefulWidget {
  const InformationSection({super.key});

  @override
  State<InformationSection> createState() => _InformationSectionState();
}

class _InformationSectionState extends State<InformationSection> {
  final AppColors appColors = getIt<AppColors>();
  final AppTextStyle appTextStyle = getIt<AppTextStyle>();
  final LayoutConstants layoutConstants = getIt<LayoutConstants>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: layoutConstants.headerPadding,
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          return buildNewsCard(context);
        },
      ),
    );
  }

  Widget buildNewsCard(BuildContext context) {
    return Card(
      elevation: 1,
      color: appColors.primaryColor,
      child: ListTile(
        leading: SizedBox(
          width: 60,
          child: Center(
            child: Card(
              clipBehavior: Clip.antiAlias,
              elevation: 5,
              shadowColor: Colors.black,
              child: ClipRRect(
                borderRadius: layoutConstants.smallBorderRadius,
                child: Image.asset(
                  'lib/core/resources/images/museum_welcome_images/welcome1.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
        title: Text(
          'News Title',
          style: appTextStyle.normalTextPrimary,
        ),
        subtitle: Text(
          'News Content',
          style: appTextStyle.normalTextPrimary,
        ),
        onTap: () {},
        trailing: Icon(
          Icons.arrow_forward_ios,
          color: appColors.secondaryColor,
        ),
      ),
    );
  }
}
