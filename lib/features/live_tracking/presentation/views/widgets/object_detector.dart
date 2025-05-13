// import 'dart:developer';
// import 'package:camera/camera.dart';
// import 'package:flutter/material.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:tflite/tflite.dart';

// class CustomCameraPreview extends StatefulWidget {
//   const CustomCameraPreview({super.key});

//   @override
//   State<CustomCameraPreview> createState() => _CustomCameraPreviewState();
// }

// class _CustomCameraPreviewState extends State<CustomCameraPreview> with WidgetsBindingObserver {
//   CameraController? _cameraController;
//   bool _isCameraInitialized = false;
//   bool _isDetecting = false;
//   String _resultText = '';
//   List<dynamic> _recognitions = [];
  
//   // Set this to the color you're using in your app
//   Color textColor = Colors.white;

//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addObserver(this);
    
//     // Initialize model first, then camera
//     _initModel().then((_) {
//       _initializeCamera();
//     });
//   }
  
//   @override
//   void didChangeAppLifecycleState(AppLifecycleState state) {
//     // Handle app lifecycle changes to properly manage camera resources
//     if (state == AppLifecycleState.inactive) {
//       _stopCamera();
//     } else if (state == AppLifecycleState.resumed && _cameraController != null) {
//       _initializeCamera();
//     }
//   }

//   Future<void> _initModel() async {
//     try {
//       // Use custom mode instead of YOLO mode because our model is YOLOv8
//       // which has a different output format than what the plugin expects
//       await Tflite.loadModel(
//         model: "assets/tfLite/best_float32.tflite",
//         labels: "assets/tfLite/labels2.txt",
//         isAsset: true,
//         numThreads: 1,
//         useGpuDelegate: false,
//       );
//       log("TFLite model loaded successfully");
//     } catch (e) {
//       log("Failed to load TFLite model: $e");
//     }
//   }

//   void _stopCamera() {
//     if (_cameraController != null) {
//       if (_cameraController!.value.isStreamingImages) {
//         _cameraController!.stopImageStream();
//       }
//     }
//   }

//   Future<void> _initializeCamera() async {
//     // Stop any existing camera first
//     _stopCamera();
    
//     // Request camera permission
//     final status = await Permission.camera.request();
//     if (!status.isGranted) {
//       log("Camera permission denied");
//       return;
//     }
    
//     try {
//       // Get available cameras
//       final cameras = await availableCameras();
//       if (cameras.isEmpty) {
//         log("No cameras found");
//         return;
//       }
      
//       // Create camera controller
//       _cameraController = CameraController(
//         cameras[0],
//         ResolutionPreset.low, // Use lower resolution for better performance
//         enableAudio: false,
//         imageFormatGroup: ImageFormatGroup.yuv420,
//       );
      
//       // Initialize the camera
//       await _cameraController!.initialize();
      
//       if (!mounted) return;
      
//       // Start camera stream only when everything is ready
//       await _cameraController!.startImageStream(_processImage);
      
//       setState(() {
//         _isCameraInitialized = true;
//       });
      
//       log("Camera initialized successfully");
//     } catch (e) {
//       log("Error initializing camera: $e");
//     }
//   }

//   void _processImage(CameraImage image) {
//     if (_isDetecting) return; // Skip if we're already processing
    
//     _isDetecting = true;
    
//     try {
//       // Using detectObjectOnFrameByteArray instead of detectObjectOnFrame for better control
//       Tflite.detectObjectOnFrame(
//         bytesList: image.planes.map((plane) => plane.bytes).toList(),
//         model: "YOLO",
//         imageHeight: image.height,
//         imageWidth: image.width,
//         imageMean: 0,
//         imageStd: 255.0,
//         threshold: 0.3,
//         numResultsPerClass: 1,
//         asynch: true,
//       ).then((recognitions) {
//         // Process recognitions if available
//         if (mounted && recognitions != null) {
//           setState(() {
//             _recognitions = recognitions;
            
//             // Update result text
//             if (_recognitions.isEmpty) {
//               _resultText = "No objects detected";
//             } else {
//               _resultText = _recognitions.map((result) {
//                 return "${result['detectedClass']} ${(result['confidenceInClass'] * 100).toStringAsFixed(0)}%";
//               }).join('\n');
//             }
//           });
//         }
//         _isDetecting = false;
//       }).catchError((e) {
//         log("Detection error: $e");
//         _isDetecting = false;
//       });
//     } catch (e) {
//       log("Image processing error: $e");
//       _isDetecting = false;
//     }
//   }

//   @override
//   void dispose() {
//     WidgetsBinding.instance.removeObserver(this);
//     _stopCamera();
//     _cameraController?.dispose();
//     Tflite.close();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (!_isCameraInitialized || _cameraController == null) {
//       return Container(
//         height: MediaQuery.of(context).size.height * 0.52,
//         color: Colors.black,
//                   child: const Center(
//             child: CircularProgressIndicator(),
//           ),
        
//       );
//     }

//     return Container(
//       height: MediaQuery.of(context).size.height * 0.52,
//       color: Colors.black,
//       child: Stack(
//         children: [
//           // Camera preview
//           CameraPreview(_cameraController!),
          
//           // Simple text overlay for detection results
//           Positioned(
//             top: 20,
//             left: 10,
//             right: 10,
//             child: Container(
//               padding: const EdgeInsets.all(8),
//               decoration: BoxDecoration(
//                 color: Colors.black.withOpacity(0.6),
//                 borderRadius: BorderRadius.circular(8),
//               ),
//               child: Text(
//                 _resultText,
//                 style: TextStyle(
//                   color: textColor,
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }