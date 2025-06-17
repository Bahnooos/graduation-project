// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:graduation_project/core/routes/routes.dart';
import 'package:graduation_project/core/utils/app_color.dart';
import 'package:graduation_project/core/utils/styles.dart';
import 'package:graduation_project/core/local_storage/auth_local_storage.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  _SplashViewBodyState createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  double _scale = 0.1;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 500), () {
      setState(() {
        _scale = 1.0;
      });
    });

    Future.delayed(const Duration(seconds: 2), () async {
      final isLoggedIn = await AuthLocalStorage.getLoginStatus();

      if (isLoggedIn) {
        Navigator.pushReplacementNamed(context, Routes.navigationHome);
      } else {
        Navigator.pushReplacementNamed(context, Routes.login);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TweenAnimationBuilder(
        tween: Tween<double>(begin: 0.1, end: _scale),
        duration: Duration(seconds: 1),
        curve: Curves.easeOut,
        builder: (context, double scale, child) {
          return Transform.scale(
            scale: scale,
            child: child,
          );
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.jpg',
              height: 100,
              width: 100,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'asarak',
                  style: Styles.interBold40.copyWith(
                    color: AppColor.textWhiteColor,
                  ),
                ),
                Text(
                  '\n',
                  style: Styles.latoBold12,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
