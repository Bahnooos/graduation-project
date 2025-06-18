import 'package:camera/camera.dart';
import 'package:flutter_vision/flutter_vision.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class FlutterVisionService {
  final FlutterVision _vision = FlutterVision();
  bool _isModelLoaded = false;

  bool get isModelLoaded => _isModelLoaded;

  Future<void> loadModel() async {
    try {
      await _vision.loadYoloModel(
        labels: 'assets/tfLite/labels.txt',
        modelPath: 'assets/tfLite/Final_Model.tflite',
        modelVersion: "yolov8",
        numThreads: 2,
        useGpu: true,
      );
      _isModelLoaded = true;
    } catch (e) {
      throw Exception("Failed to load YOLO model: $e");
    }
  }

  Future<List<Map<String, dynamic>>> detectObjects(CameraImage image) async {
    if (!_isModelLoaded) await loadModel();

    try {
      return await _vision.yoloOnFrame(
        bytesList: image.planes.map((plane) => plane.bytes).toList(),
        imageHeight: image.height,
        imageWidth: image.width,
        iouThreshold: 0.2,
        confThreshold: 0.3,
        classThreshold: 0.3,
      );
    } catch (e) {
      return [];
    }
  }

  Future<void> dispose() async {
    _isModelLoaded = false;
  }
}
