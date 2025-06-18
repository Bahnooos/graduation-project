// camera_view.dart
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../managers/camera detection cubit/camera_detection_cubit.dart';


class CameraView extends StatelessWidget {
  const CameraView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CameraDetectionCubit, CameraDetectionState>(
      builder: (context, state) {
        if (state is CameraLoadedState) {
          final screenSize = MediaQuery.of(context).size;
          return Stack(
            fit: StackFit.expand,
            children: [
              CameraPreview(state.controller),
              ..._buildDetectionBoxes(screenSize, state),
              _buildControlButton(context, state),
            ],
          );
        }
        return const SizedBox.shrink();
      },
    );
  }

  List<Widget> _buildDetectionBoxes(Size screenSize, CameraLoadedState state) {
    if (state.detectionResults.isEmpty || state.currentImage == null) return [];
    
    final factorY = screenSize.width / state.currentImage!.height;
    final factorX = screenSize.height / state.currentImage!.width;
    const labelBg = Color.fromARGB(255, 50, 233, 30);

    return state.detectionResults.map((result) {
      return Positioned(
        left: result["box"][0] * factorX,
        top: result["box"][1] * factorY,
        width: (result["box"][2] - result["box"][0]) * factorX,
        height: (result["box"][3] - result["box"][1]) * factorY,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.pink, width: 2),
          ),
          child: Text(
            "${result['tag']} ${(result['box'][4] * 100).toStringAsFixed(0)}%",
            style: TextStyle(
              background: Paint()..color = labelBg,
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ),
      );
    }).toList();
  }

  Widget _buildControlButton(BuildContext context, CameraLoadedState state) {
    return Positioned(
      bottom: 50,
      left: 0,
      right: 0,
      child: Center(
        child: Container(
          height: 80,
          width: 80,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(width: 5, color: Colors.white),
          ),
          child: IconButton(
            onPressed: () => state.isDetecting 
                ? context.read<CameraDetectionCubit>().stopDetection() 
                : context.read<CameraDetectionCubit>().startDetection(),
            icon: Text(
              state.isDetecting ? 'stop' : 'start',
              style: TextStyle(color: state.isDetecting ? Colors.red : Colors.white),
            ),
            iconSize: 50,
          ),
        ),
      ),
    );
  }
}