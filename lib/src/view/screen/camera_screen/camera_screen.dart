import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:flutter_ar_app/core/initializer/app_initializer.dart';
import 'package:flutter_ar_app/src/bloc/bloc.dart';
import 'package:flutter_ar_app/src/model/model.dart';
import 'package:flutter_ar_app/src/view/view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import './my_ar_screen.dart';

@RoutePage()
class CameraPageTab extends StatefulWidget {
  final MuseumArtifactModel artifact;

  const CameraPageTab({
    super.key,
    required this.artifact,
  });

  @override
  State<CameraPageTab> createState() => _CameraPageTabState();
}

class _CameraPageTabState extends State<CameraPageTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'AR Experience',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: MyARScreen(
        artifact: widget.artifact,
      ),
    );
  }
}

// class _CameraPageTabState extends State<CameraPageTab> {
//   CameraBloc cameraBloc = getIt<CameraBloc>();
//   @override
//   void initState() {
//     super.initState();
//     if (cameraBloc.isClosed) {
//       cameraBloc = getIt<CameraBloc>();
//     }
//     cameraBloc.add(const CameraInitialized());
//   }

//   @override
//   void dispose() {
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider.value(
//       value: cameraBloc,
//       child: BlocConsumer<CameraBloc, CameraState>(
//         listener: (context, state) {
//           if (state.status == CameraStatus.success) {
//             ScaffoldMessenger.of(context)
//               ..hideCurrentSnackBar()
//               ..showSnackBar(
//                 const SnackBar(
//                   content: Text('Camera initialized successfully'),
//                 ),
//               );
//           } else if (state.status == CameraStatus.failure) {
//             ScaffoldMessenger.of(context)
//               ..hideCurrentSnackBar()
//               ..showSnackBar(
//                 SnackBar(
//                   content: Text(state.error!),
//                 ),
//               );
//           }
//         },
//         builder: (context, state) => Scaffold(
//           appBar: AppBar(
//             title: const Text('Camera screen'),
//           ),
//           body: cameraBloc.state.status == CameraStatus.loading
//               ? const Center(
//                   child: CircularProgressIndicator(),
//                 )
//               : cameraBloc.state.status == CameraStatus.success
//                   ? CameraPreview(cameraBloc.cameraController)
//                   : const Center(
//                       child: Text('Failed to initialize camera'),
//                     ),
//         ),
//       ),
//     );
//   }
// }
