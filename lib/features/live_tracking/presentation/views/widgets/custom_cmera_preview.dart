import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/dependency%20injection/service_locator_setup.dart';
import 'package:graduation_project/features/live_tracking/presentation/managers/camera%20detection%20cubit/camera_detection_cubit.dart';
import 'package:graduation_project/features/live_tracking/presentation/views/widgets/camera_view.dart';


class CustomCameraPreview extends StatelessWidget {
  const CustomCameraPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locate<CameraDetectionCubit>()..initializeCamera(),
      child: const CameraPreviewWidget(),
    );
  }
}

class CameraPreviewWidget extends StatelessWidget {
  const CameraPreviewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<CameraDetectionCubit, CameraDetectionState>(
        builder: (context, state) {
          if (state is CameraInitialState || state is CameraLoadingState) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 16),
                  Text("Loading camera and model..."),
                ],
              ),
            );
          }

          if (state is CameraErrorState) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error, size: 64, color: Colors.red),
                  const SizedBox(height: 16),
                  Text(state.message, textAlign: TextAlign.center),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () => context.read<CameraDetectionCubit>().initializeCamera(),
                    child: const Text("Retry"),
                  ),
                ],
              ),
            );
          }

          return const CameraView();
        },
     
    );
  }
}