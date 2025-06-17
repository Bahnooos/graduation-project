// camera_detection_state.dart


part of 'camera_detection_cubit.dart';

abstract class CameraDetectionState extends Equatable {
  const CameraDetectionState();
  @override
  List<Object?> get props => [];
}

class CameraInitialState extends CameraDetectionState {}
class CameraLoadingState extends CameraDetectionState {}

class CameraLoadedState extends CameraDetectionState {
  final CameraController controller;
  final bool isDetecting;
  final List<Map<String, dynamic>> detectionResults;
  final CameraImage? currentImage;

  const CameraLoadedState({
    required this.controller,
    this.isDetecting = false,
    this.detectionResults = const [],
    this.currentImage,
  });

  CameraLoadedState copyWith({
    CameraController? controller,
    bool? isDetecting,
    List<Map<String, dynamic>>? detectionResults,
    CameraImage? currentImage,
  }) {
    return CameraLoadedState(
      controller: controller ?? this.controller,
      isDetecting: isDetecting ?? this.isDetecting,
      detectionResults: detectionResults ?? this.detectionResults,
      currentImage: currentImage ?? this.currentImage,
    );
  }

  @override
  List<Object?> get props => [controller, isDetecting, detectionResults, currentImage];
}

class CameraErrorState extends CameraDetectionState {
  final String message;
  const CameraErrorState(this.message);
  @override
  List<Object> get props => [message];
}