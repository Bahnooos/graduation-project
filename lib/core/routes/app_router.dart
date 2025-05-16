import 'package:flutter/material.dart';
import 'package:graduation_project/core/routes/routes.dart';
import 'package:graduation_project/features/authentication/presentation/views/login_view.dart';
import 'package:graduation_project/features/authentication/presentation/views/sign_up_view.dart';
import 'package:graduation_project/features/history/presentation/views/history_view.dart';
import 'package:graduation_project/features/home/presentation/views/navigation_home_view.dart';
import 'package:graduation_project/features/live_tracking/presentation/views/live_tracking_view.dart';
import 'package:graduation_project/features/settings/presentation/views/settings_view.dart';
import 'package:graduation_project/features/splash/presentation/views/splash_view.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.welcome:
        return MaterialPageRoute(
          builder: (_) => const SplashView(),
        );
      case Routes.signUp:
        return MaterialPageRoute(
          builder: (_) => const SignUpView(),
        );
      case Routes.login:
        return MaterialPageRoute(
          builder: (_) => const LoginView(),
        );
      case Routes.navigationHome:
        return MaterialPageRoute(
          builder: (_) => const NavigationHomeView(),
        );
      case Routes.liveTracking:
        return MaterialPageRoute(
          builder: (_) => const LiveTrackingView(),
        );
      case Routes.settings:
        return MaterialPageRoute(
          builder: (_) => const SettingsView(),
        );
      case Routes.history:
        return MaterialPageRoute(
          builder: (_) => const HistoryView(),
        );

      default:
        return null;
    }
  }
}
