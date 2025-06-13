import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/features/authentication/models/user_data_repository.dart';
import 'package:graduation_project/features/authentication/presentation/cubit/forget_password_cubit/forget_password_cubit.dart';
import 'package:graduation_project/masarak_app.dart';
import 'package:graduation_project/features/authentication/presentation/cubit/google_sign_in_cubit/google_sign_in_cubit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:graduation_project/core/repositories/authentication_repository.dart';

void main() async {
  await ScreenUtil.ensureScreenSize();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    DevicePreview(
      builder: (context) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => GoogleSignInCubit(
              AuthenticationRepository(),
              UserDataRepository(),
            ),
          ),
          BlocProvider(
            create: (context) => ForgetPasswordCubit(
              AuthenticationRepository(),
            ),
          ),
        ],
        child: const MasarakApp(),
      ),
    ),
  );
}
