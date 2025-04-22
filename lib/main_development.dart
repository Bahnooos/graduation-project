import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/masarak_app.dart';


void main() async{
  // To fix texts beging hidden bug in flutter_screenutil release mode 
  WidgetsFlutterBinding.ensureInitialized();
   await ScreenUtil.ensureScreenSize();
  runApp(
    DevicePreview(
      builder: (context) => const MasarakApp(),
    ),
  );
}
