import 'package:get_it/get_it.dart';
import 'package:graduation_project/core/services/camera_service.dart';
import 'package:graduation_project/core/services/flutter_tts_service.dart';
import 'package:graduation_project/core/services/flutter_vision_service.dart';

import '../../features/live_tracking/presentation/managers/camera detection cubit/camera_detection_cubit.dart';


final getIt = GetIt.instance;


void setupServiceLocator() {
  // Register services
  getIt.registerLazySingleton<CameraService>(() => CameraService());
  getIt.registerLazySingleton<FlutterTtsService>(() => FlutterTtsService());
  getIt.registerLazySingleton<FlutterVisionService>(() => FlutterVisionService());
  
  // Register Cubit factory
  getIt.registerFactory<CameraDetectionCubit>(() => CameraDetectionCubit(
    cameraService: getIt<CameraService>(),
    ttsService: getIt<FlutterTtsService>(),
    visionService: getIt<FlutterVisionService>(),
  ));
}

// Helper function to get dependencies
T locate<T extends Object>() => getIt<T>();