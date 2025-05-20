import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/features/authentication/presentation/cubit/authentication_cubit.dart';
import 'package:graduation_project/masarak_app.dart';

void main() {
  runApp(
    BlocProvider(
      create: (context) => AuthenticationCubit(),
      child: DevicePreview(
        builder: (context) => const MasarakApp(),
      ),
    ),
  );
}
