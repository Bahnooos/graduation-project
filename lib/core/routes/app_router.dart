import 'package:flutter/material.dart';
import 'package:graduation_project/core/routes/routes.dart';
import 'package:graduation_project/features/authentication/presentation/views/login_view.dart';
import 'package:graduation_project/features/authentication/presentation/views/sign_up_view.dart';
import 'package:graduation_project/features/settings/presentation/views/settings_view.dart';
import 'package:graduation_project/features/splash/presentation/views/splash_view.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.settings:
        return MaterialPageRoute(
          builder: (_) => const SettingsView(),
        );
      case Routes.welcome:
        return MaterialPageRoute(
          builder: (_) => const SplashView(),
        );
      case Routes.login:
        return MaterialPageRoute(
          builder: (_) => const LoginView(),
        );
      case Routes.signUp:
        return MaterialPageRoute(
          builder: (_) => const SignUpView(),
        );
      default:
        return null;
    }
  }
}
