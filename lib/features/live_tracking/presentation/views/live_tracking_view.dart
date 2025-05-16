import 'package:flutter/material.dart';
import 'package:graduation_project/features/live_tracking/presentation/views/widgets/live_tracking_view_body.dart';

class LiveTrackingView extends StatelessWidget {
  const LiveTrackingView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appColorTitle: 'Live ',
      // whiteTitle: 'Tracking',
      body: LiveTrackingViewBody(),
    );
  }
}
