import 'package:flutter/material.dart';

class CustomCircleAvatar extends StatelessWidget {
  const CustomCircleAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 16),
      child: const CircleAvatar(
        radius: 15,
        backgroundImage: AssetImage(
            'lib/core/resources/images/museum_welcome_images/welcome1.jpg'),
      ),
    );
  }
}
