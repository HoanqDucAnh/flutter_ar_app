import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'camera_events.dart';
part 'camera_state.dart';

class CameraBloc extends Bloc<CameraEvent, CameraState> {
  CameraBloc()
      : super(const CameraState(
          status: CameraStatus.initial,
        )) {
    // TODO: implement event handlers
  }
}