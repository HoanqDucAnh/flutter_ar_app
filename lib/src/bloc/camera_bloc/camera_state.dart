part of 'camera_bloc.dart';

enum CameraStatus { initial, loading, success, failure }

class CameraState extends Equatable {
  const CameraState({
    required this.status,
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
}