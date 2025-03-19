import 'package:flutter/material.dart';
import 'package:graduation_project/features/home/presentation/views/home_view.dart';
import 'package:graduation_project/features/live_tracking/presentation/views/live_tracking_view.dart';
import 'package:graduation_project/features/settings/presentation/views/settings_view.dart';

abstract class Constants {
  static const String lato = 'Lato';

  static final List<Widget> pages = [
    SettingsView(),
    Center(child: Text('Statistics')),
    HomeView(),
    LiveTrackingView(),
    Center(child: Text('History')),
  ];
}
