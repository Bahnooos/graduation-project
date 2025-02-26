import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/masarak_app.dart';

void main() {
  runApp(
    DevicePreview(
      builder: (context) => const MasarakApp(),
    ),
  );
}
