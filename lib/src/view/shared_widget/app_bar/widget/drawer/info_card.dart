import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ar_app/src/view/shared_widget/app_bar/widget/avatar.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({
    Key? key,
    required this.name,
    required this.bio,
  }) : super(key: key);

  final String name, bio;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      // leading: const CircleAvatar(
      //   backgroundColor: Colors.white24,
      //   child: Icon(
      //     CupertinoIcons.person,
      //     color: Colors.white,
      //   ),
      // ),
      leading: const CustomCircleAvatar(),
      title: Text(
        name,
        style: const TextStyle(color: Colors.white),
      ),
      subtitle: Text(
        bio,
        style: const TextStyle(color: Colors.white70),
      ),
    );
  }
}