import 'package:flutter/material.dart';
import 'package:graduation_project/core/routes/routes.dart';
import 'package:graduation_project/features/splash/presentation/views/widgets/splash_view_body_content.dart';

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
    return SplashViewBodyContent(scale: _scale);
  }
}
