part of 'camera_bloc.dart';

enum CameraStatus { initial, loading, success, failure }

class CameraState extends Equatable {
  const CameraState({
    this.status = CameraStatus.initial,
    this.error,
  });

  final CameraStatus status;
  final String? error;

  @override
  List<Object?> get props => [status, error];

  CameraState copyWith({
    CameraStatus? status,
    String? error,
  }) {
    return CameraState(
      status: status ?? this.status,
      error: error,
    );
  }

  @override
  String toString() {
    return 'CameraState { status: $status, error: $error }';
  }
}
