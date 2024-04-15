import 'package:flutter/material.dart';
import 'package:flutter_ar_app/core/initializer/app_initializer.dart';
import 'package:flutter_ar_app/shared/color/app_colors.dart';

class InformationSection extends StatefulWidget {
  const InformationSection({super.key});

  @override
  State<InformationSection> createState() => _InformationSectionState();
}

class _InformationSectionState extends State<InformationSection> {
  final AppColors appColors = getIt<AppColors>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
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
      elevation: 0,
      color: Colors.white,
      child: ListTile(
        leading: SizedBox(
          width: 60,
          child: Center(
            child: Card(
              clipBehavior: Clip.antiAlias,
              elevation: 5,
              shadowColor: Colors.black,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  'lib/core/resources/images/museum_welcome_images/welcome1.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
        title: const Text('News Title'),
        subtitle: const Text('News Content'),
        onTap: () {},
        trailing: Icon(
          Icons.arrow_forward_ios,
          color: appColors.secondaryColor,
        ),
      ),
    );
  }
}