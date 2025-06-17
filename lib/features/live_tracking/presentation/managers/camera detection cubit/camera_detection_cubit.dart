import 'package:camera/camera.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/services/camera_service.dart';
import 'package:graduation_project/core/services/flutter_tts_service.dart';
import 'package:graduation_project/core/services/flutter_vision_service.dart';
import 'package:injectable/injectable.dart';

part 'camera_detection_state.dart';

@injectable
class CameraDetectionCubit extends Cubit<CameraDetectionState> {
  final CameraService _cameraService;
  final FlutterTtsService _ttsService;
  final FlutterVisionService _visionService;

  CameraDetectionCubit({
    required CameraService cameraService,
    required FlutterTtsService ttsService,
    required FlutterVisionService visionService,
  })  : _cameraService = cameraService,
        _ttsService = ttsService,
        _visionService = visionService,
        super(CameraInitialState());

  Future<void> initializeCamera() async {
    try {
      emit(CameraLoadingState());
      await _cameraService.initialize();
      await _ttsService.initialize();
      await _visionService.loadModel();
      emit(CameraLoadedState(controller: _cameraService.controller!));
    } catch (e) {
      emit(CameraErrorState("Failed to initialize: $e"));
    }
  }

  Future<void> startDetection() async {
    final s = state;
    if (s is! CameraLoadedState || s.isDetecting) return;
    emit(s.copyWith(isDetecting: true));
    await _cameraService.startImageStream(_processFrame);
  }

  Future<void> stopDetection() async {
    final s = state;
    if (s is! CameraLoadedState) return;
    await _cameraService.stopImageStream();
    emit(s.copyWith(isDetecting: false, detectionResults: []));
  }

  Future<void> _processFrame(CameraImage image) async {
    final s = state;
    if (s is! CameraLoadedState || !s.isDetecting) return;

    final results = await _visionService.detectObjects(image);
    if (results.isNotEmpty) {
      emit(s.copyWith(detectionResults: results, currentImage: image));
      await _ttsService.speak(results.first['tag'] as String);
    }
  }

  @override
  Future<void> close() async {
    await _cameraService.dispose();
    await _ttsService.dispose();
    await _visionService.dispose();
    return super.close();
  }
}
