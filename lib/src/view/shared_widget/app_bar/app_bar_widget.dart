import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String appName;
  final VoidCallback onDrawerPressed;

  const CustomAppBar({
    super.key,
    required this.appName,
    required this.onDrawerPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(appName),
      leading: IconButton(
        icon: const Icon(Icons.menu),
        onPressed: onDrawerPressed,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
