import 'package:flutter/material.dart';
import 'package:graduation_project/core/routes/routes.dart';
import 'package:graduation_project/core/widgets/app_logo_name.dart';

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

    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, Routes.navigationHome);
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
        child: AppLogoName(
          logoSize: 100,
          fontSize: 50,
        ),
      ),
    );
  }
}
