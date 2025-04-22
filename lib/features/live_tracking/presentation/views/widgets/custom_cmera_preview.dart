import 'dart:developer';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tflite/flutter_tflite.dart';
import 'package:graduation_project/core/utils/app_color.dart';
import 'package:permission_handler/permission_handler.dart';

class CustomCameraPreview extends StatefulWidget {
  const CustomCameraPreview({super.key});

  @override
  State<CustomCameraPreview> createState() => _CustomCameraPreviewState();
}

class _CustomCameraPreviewState extends State<CustomCameraPreview> {
  late CameraController _cameraController;
  late List<CameraDescription> cameras;
  CameraImage? cameraImage;
  var isCameraInitialized = false;
  bool isDetecting = false;

  bool isWorking = false;
  String result = '';

  @override
  void initState() {
    super.initState();
    initModel();
    _initializeCamera();
  }

  Future<void> initModel() async {
    try {
      String? res = await Tflite.loadModel(
        model: "assets/tfLite/mobilenet_v1_1.0_224.tflite",
        labels: "assets/tfLite/mobilenet_v1_1.0_224.txt",
        isAsset: true,
        numThreads: 2, // Reduce if crashes persist
        useGpuDelegate: false, // Enable GPU acceleration
      );
      log("Model loaded: $res");
    } catch (e) {
      log("Model loading failed: $e");
    }
  }

  Future<void> _initializeCamera() async {
    if (await Permission.camera.request().isGranted) {
      cameras = await availableCameras();
      _cameraController = CameraController(cameras[0], ResolutionPreset.medium, imageFormatGroup: ImageFormatGroup.yuv420);
      await _cameraController.initialize().then((value) {
        if (!mounted) return;
        setState(() {
          _cameraController.startImageStream((imgeFromStream) {
            if (!isWorking) {
              isWorking = true;
              cameraImage = imgeFromStream;
              runModelOnStreamFrame();
            }
          });
        });
      });

      setState(() => isCameraInitialized = true);
    }
  }

  runModelOnStreamFrame() async {
    await Future.delayed(Duration(milliseconds: 500));
    if (cameraImage != null) {
      var recognitions = await Tflite.runModelOnFrame(
        bytesList: cameraImage!.planes.map((plane) => plane.bytes).toList(),
        imageHeight: cameraImage!.height,
        imageWidth: cameraImage!.width,
        imageMean: 127.5,
        imageStd: 127.5,
        rotation: 90,
        threshold: 0.1,
        numResults: 2,
        asynch: true,
      );
      result = '';
      recognitions?.forEach((response) {
        result += response['label'] + ' ' + (response['confidence'] as double).toStringAsFixed(2) + '/n/n';
      });
      setState(() {
        result;
      });
      isWorking = false;
    }
  }

  @override
  void dispose() {
    _cameraController.dispose();
    Tflite.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      height: MediaQuery.of(context).size.height * 0.52,
      color: Colors.black,
      child: cameraImage != null
          ? Stack(
              children: [
                CameraPreview(_cameraController),
                Center(
                  child: Container(
                    margin: EdgeInsets.only(top: 55.0),
                    child: SingleChildScrollView(
                      child: Text(result,
                      style: TextStyle(
                        color: AppColor.textBlackColor,
                        fontSize: 30,
                      ),
                      textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                )
              ],
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
