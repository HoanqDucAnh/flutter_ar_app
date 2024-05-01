// import 'package:flutter/material.dart';
// import 'package:flutter_ar_app/core/initializer/app_initializer.dart';
// import 'dart:ui';

// import 'package:flutter_ar_app/shared/color/app_colors.dart';

// class IntroductionSection extends StatefulWidget {
//   const IntroductionSection({super.key});

//   @override
//   _IntroductionSectionState createState() => _IntroductionSectionState();
// }

// class _IntroductionSectionState extends State<IntroductionSection>
//     with SingleTickerProviderStateMixin {
//   late final AnimationController _controller;
//   late final Animation<LinearGradient> _gradient;
//   final AppColors appColors = getIt<AppColors>();

//   @override
//   void initState() {
//     super.initState();

//     _controller = AnimationController(
//       duration: const Duration(seconds: 5),
//       vsync: this,
//     )..repeat(reverse: true);

//     _gradient = LinearGradientTween(
//       begin: LinearGradient(
//         colors: [appColors.linearColor1, appColors.linearColor2],
//         begin: Alignment.topLeft,
//         end: Alignment.bottomRight,
//       ),
//       end: LinearGradient(
//         colors: [appColors.linearColor2, appColors.linearColor1],
//         begin: Alignment.bottomRight,
//         end: Alignment.topLeft,
//       ),
//     ).animate(_controller);
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(8),
//         // boxShadow: [
//         //   BoxShadow(
//         //     color: appColors.shadowColor.withOpacity(0.5),
//         //     blurRadius: 5,
//         //     offset: const Offset(0, 2),
//         //   ),
//         // ],
//       ),
//       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
//       child: AnimatedBuilder(
//         animation: _gradient,
//         builder: (context, child) {
//           return Container(
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(8),
//               gradient: _gradient.value,
//             ),
//             child: const Text(
//                 'asdhfashdfuashdfausdhfasuidhfasuidhfauisdhfuaisdhfaiusdhfausidhfsauidhfausidhfauisdhfauishfasiudfhasuidfhasuidhfasuidhfuaishdfui'),
//           );
//         },
//       ),
//     );
//   }
// }

// class LinearGradientTween extends Tween<LinearGradient> {
//   LinearGradientTween(
//       {required LinearGradient begin, required LinearGradient end})
//       : super(begin: begin, end: end);

//   List<Color> lerpColorList(List<Color> a, List<Color> b, double t) {
//     return List<Color>.generate(a.length, (i) => Color.lerp(a[i], b[i], t)!);
//   }

//   @override
//   LinearGradient lerp(double t) => LinearGradient(
//         colors: lerpColorList(begin!.colors, end!.colors, t),
//         stops: lerpDoubleList(begin!.stops, end!.stops, t),
//         begin: begin!.begin,
//         end: begin!.end,
//       );

//   List<double>? lerpDoubleList(List<double>? a, List<double>? b, double t) {
//     if (a == null && b == null) return null;
//     a = a ?? List<double>.filled(b!.length, 0.0, growable: true);
//     b = b ?? List<double>.filled(a.length, 1.0, growable: true);
//     return List<double>.generate(a.length, (i) => lerpDouble(a![i], b![i], t)!,
//         growable: false);
//   }
// }

import 'package:circular_motion/circular_motion.dart';
import 'package:flutter/material.dart';

class IntroductionSection extends StatelessWidget {
  const IntroductionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 390,
        height: 390,
        child: SafeArea(
          // Here's the magic.
          child: CircularMotion(
            behavior: HitTestBehavior.opaque,
            speedRunEnabled: false,
            centerWidget: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(30),
              ),
              child: const Center(
                child: Text('center'),
              ),
            ),
            children: List.generate(
              6,
              (index) {
                return InkWell(
                  onTap: () {
                    print('Tapped $index');
                  },
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Center(
                      child: Text('$index'),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
