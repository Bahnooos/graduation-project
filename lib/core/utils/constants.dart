import 'package:flutter/material.dart';
import 'package:graduation_project/features/history/presentation/views/history_view.dart';
import 'package:graduation_project/features/home/presentation/views/home_view.dart';
import 'package:graduation_project/features/live_tracking/presentation/views/live_tracking_view.dart';
import 'package:graduation_project/features/profile/presentation/views/profile_view.dart';

abstract class Constants {
  static const String lato = 'Lato';

  static final List<Widget> pages = [
    ProfileView(),
    HomeView(),
    LiveTrackingView(),
    HistoryView(),
  ];
}
