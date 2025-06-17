import 'package:camera/camera.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class CameraService {
  CameraController? _controller;
  
  CameraController? get controller => _controller;
  bool get isInitialized => _controller?.value.isInitialized ?? false;

  Future<void> initialize() async {
    final cameras = await availableCameras();
    if (cameras.isEmpty) {
      throw Exception("No cameras available");
    }
    
    _controller = CameraController(cameras[0], ResolutionPreset.medium);
    await _controller!.initialize();
  }

  Future<void> startImageStream(Function(CameraImage) onImage) async {
    if (_controller?.value.isStreamingImages == true) return;
    await _controller?.startImageStream(onImage);
  }

  Future<void> stopImageStream() async {
    await _controller?.stopImageStream();
  }

  Future<void> dispose() async {
    await _controller?.dispose();
    _controller = null;
  }
}