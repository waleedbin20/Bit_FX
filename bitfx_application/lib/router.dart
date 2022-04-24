import 'package:bitfx_application/ui/views/FollowUs.dart';
import 'package:bitfx_application/ui/views/Privacy.dart';
import 'package:bitfx_application/ui/views/calculator/calculator_view.dart';
import 'package:bitfx_application/ui/views/home/home_view.dart';
import 'package:bitfx_application/ui/views/login/login_view.dart';
import 'package:bitfx_application/ui/views/profile/profile_view.dart';
import 'package:bitfx_application/ui/views/singup/signup_view.dart';
import 'package:bitfx_application/ui/views/splash/splash_view.dart';
import 'package:bitfx_application/ui/views/support/form_view.dart';
import 'package:bitfx_application/ui/widgets/route_paths.dart';
import 'package:flutter/material.dart';

class Router {
  static Route<T> generateRoute<T>(RouteSettings settings) {
    switch (settings.name) {
      case RoutePaths.login:
        return MaterialPageRoute(
            builder: (_) => const LoginView(), settings: settings);

      case RoutePaths.splash:
        return MaterialPageRoute(
            builder: (_) => const SplashView(), settings: settings);

      case RoutePaths.signup:
        return MaterialPageRoute(
            builder: (_) => const SignupView(), settings: settings);

      case RoutePaths.bottomNavBar:
        return MaterialPageRoute(
            builder: (_) => BottomNavBar(), settings: settings);

      case RoutePaths.profilePage:
        return MaterialPageRoute(
            builder: (_) => ProfileView(), settings: settings);

      case RoutePaths.calculator:
        return MaterialPageRoute(
            builder: (_) => CalculatorView(), settings: settings);

      case RoutePaths.formPage:
        return MaterialPageRoute(
            builder: (_) => FormView(), settings: settings);

             case RoutePaths.privacypage:
        return MaterialPageRoute(
            builder: (_) => PrivacyPolicy(), settings: settings);

             case RoutePaths.followUs:
        return MaterialPageRoute(
            builder: (_) => FollowUs(), settings: settings);

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text("No route defined for ${settings.name}"),
                  ),
                ));
    }
  }
}
