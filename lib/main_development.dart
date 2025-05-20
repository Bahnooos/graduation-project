import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/features/authentication/presentation/cubit/authentication_cubit.dart';
import 'package:graduation_project/masarak_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  // To fix texts beging hidden bug in flutter_screenutil release mode
  await ScreenUtil.ensureScreenSize();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    BlocProvider(
      create: (context) => AuthenticationCubit(),
      child: DevicePreview(
        builder: (context) => const MasarakApp(),
      ),
    ),
  );
}
