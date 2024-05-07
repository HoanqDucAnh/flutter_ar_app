import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ar_app/src/view/shared_widget/app_bar/widget/drawer/side_bar.dart';

class CustomDrawer extends StatelessWidget {
  final ValueNotifier<int> selectedMenuIndex;
  const CustomDrawer({super.key, required this.selectedMenuIndex});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return ValueListenableBuilder<int>(
            valueListenable: selectedMenuIndex,
            builder: (context, value, child) {
              return SideBar(selectedMenuIndex: selectedMenuIndex);
            }
          );
        }
      ),
    );
  }
}
