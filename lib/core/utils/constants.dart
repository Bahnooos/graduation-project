import 'package:flutter/material.dart';
import 'package:graduation_project/features/home/presentation/views/home_view.dart';
import 'package:graduation_project/features/settings/presentation/views/settings_view.dart';

abstract class Constants {
  static const String lato = 'Lato';
  static final List<Widget> pages = [
    SettingsView(),
    Center(child: Text('Statistics')),
    HomeView(),
    Center(child: Text('Live Tracking')),
    Center(child: Text('History')),
  ];
}
