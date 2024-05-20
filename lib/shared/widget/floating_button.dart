// import 'package:flutter/material.dart';
// import 'package:flutter_ar_app/core/initializer/app_initializer.dart';
// import 'package:flutter_ar_app/shared/color/app_colors.dart';
// import 'package:flutter_ar_app/core/router/app_router.dart';

// class ScrollAwareFloatingButton extends StatefulWidget {
//   final ScrollController scrollController;
//   const ScrollAwareFloatingButton({super.key, required this.scrollController});

//   @override
//   State<ScrollAwareFloatingButton> createState() =>
//       _ScrollAwareFloatingButtonState();
// }

// class _ScrollAwareFloatingButtonState extends State<ScrollAwareFloatingButton> {
//   bool _showButton = false;

//   @override
//   void initState() {
//     super.initState();
//     widget.scrollController.addListener(_scrollListener);
//   }

//   void _scrollListener() {
//     if (widget.scrollController.offset >= 10) {
//       if (!_showButton) setState(() => _showButton = true);
//     } else {
//       if (_showButton) setState(() => _showButton = false);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     AppColors appColors = getIt<AppColors>();

//     return AnimatedOpacity(
//       opacity: _showButton ? 1.0 : 0.0,
//       duration: const Duration(milliseconds: 300),
//       child: FloatingActionButton(
//         elevation: 1,
//         onPressed: () {
//           getIt<AppRouter>().push(const CameraRouteTab());
//         },
//         heroTag: 'Camera',
//         backgroundColor: appColors.secondaryColor.withOpacity(0.8),
//         child: Icon(
//           Icons.camera_alt,
//           color: appColors.iconColor,
//         ),
//       ),
//     );
//   }
// }
