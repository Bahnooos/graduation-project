import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/routes/routes.dart';
import 'package:graduation_project/core/widgets/custom_button.dart';
import 'package:graduation_project/features/live_tracking/presentation/managers/camera%20detection%20cubit/camera_detection_cubit.dart';
import 'package:graduation_project/features/live_tracking/presentation/views/widgets/custom_cmera_preview.dart';

class LiveTrackingViewBody extends StatefulWidget {
  const LiveTrackingViewBody({super.key});

  @override
  _LiveTrackingViewBodyState createState() => _LiveTrackingViewBodyState();
}

class _LiveTrackingViewBodyState extends State<LiveTrackingViewBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 25),
      child: Column(
        children: [
          Expanded(child: CustomCameraPreview()),
          // CustomButton(
          //   onPressed: () {
             
          //   },
          //   text: 'Stop Tracking',
          // ),
        ],
      ),
    );
  }
}
