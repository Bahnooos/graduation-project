import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/routes/app_router.dart';
import 'package:graduation_project/core/routes/routes.dart';
import 'package:graduation_project/core/utils/app_color.dart';
import 'package:graduation_project/core/utils/constants.dart';

class MasarakApp extends StatelessWidget {
  const MasarakApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Masark',
        theme: ThemeData(
          textSelectionTheme: TextSelectionThemeData(
            cursorColor: AppColor.primaryColor,
            selectionColor: AppColor.primaryColor.withOpacity(0.5),
            selectionHandleColor: AppColor.primaryColor,
          ),
          fontFamily: Constants.lato,
          useMaterial3: true,
        ),
        initialRoute: Routes.welcome,
        onGenerateRoute: AppRouter().generateRoute,
      ),
    );
  }
}
