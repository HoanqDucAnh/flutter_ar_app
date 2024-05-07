import 'package:camera/camera.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import '../../controller/controller.dart';

part 'camera_events.dart';
part 'camera_state.dart';

@LazySingleton()
class CameraBloc extends Bloc<CameraEvent, CameraState> {
  final CameraLensDirection cameraLensDirection = CameraLensDirection.back;
  final ResolutionPreset resolutionPreset = ResolutionPreset.high;
  final CameraUtils cameraUtils;

  late CameraController _cameraController;

  CameraBloc({
    required this.cameraUtils,
  }) : super(const CameraState()) {
    on<CameraInitialized>(_onCameraInitialized);
    on<CameraStopped>(_onCameraStopped);
  }
  CameraController get cameraController => _cameraController;

  Future<void> _onCameraInitialized(
    CameraInitialized event,
    Emitter<CameraState> emit,
  ) async {
    emit(state.copyWith(status: CameraStatus.loading));

    try {
      _cameraController = await cameraUtils.getCameraController(
        resolutionPreset,
        cameraLensDirection,
      );

      await _cameraController.initialize();

      emit(state.copyWith(status: CameraStatus.success));
    } on CameraException catch (e) {
      emit(state.copyWith(status: CameraStatus.failure, error: e.description));
    }
  }

  Future<void> _onCameraStopped(
    CameraStopped event,
    Emitter<CameraState> emit,
  ) async {
    try {
      cameraUtils.disposeCameraController(_cameraController);
      emit(state.copyWith(status: CameraStatus.initial));
    } on CameraException catch (e) {
      emit(state.copyWith(status: CameraStatus.failure, error: e.description));
    }
  }
}
