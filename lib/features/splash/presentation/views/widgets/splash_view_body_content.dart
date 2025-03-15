import 'package:flutter/material.dart';
import 'package:graduation_project/core/widgets/app_logo_name.dart';

class SplashViewBodyContent extends StatelessWidget {
  const SplashViewBodyContent({
    super.key,
    required double scale,
  }) : _scale = scale;

  final double _scale;

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
