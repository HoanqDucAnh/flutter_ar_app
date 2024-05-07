part of 'camera_bloc.dart';

abstract class CameraEvent extends Equatable {
  const CameraEvent();

  @override
  List<Object> get props => [];
}

class CameraInitialized extends CameraEvent {
  const CameraInitialized();
}

class CameraStopped extends CameraEvent {
  const CameraStopped();
}