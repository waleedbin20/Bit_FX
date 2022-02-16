import 'package:bitfx_mobile_app/src/ui/views/home/home_view.dart';
import 'package:bitfx_mobile_app/src/ui/views/login/login_mockup_view.dart';
import 'package:bitfx_mobile_app/src/ui/views/login/login_view.dart';
import 'package:bitfx_mobile_app/src/ui/views/singup/signup_view.dart';
import 'package:bitfx_mobile_app/src/ui/views/splash/splash_view.dart';
import 'package:bitfx_mobile_app/src/ui/widgets/route_paths.dart';
import 'package:flutter/material.dart';


class Router {
  static Route<T> generateRoute<T> (RouteSettings settings) {
    switch (settings.name) {
      case RoutePaths.login:
        return MaterialPageRoute(builder: (_) =>  LoginView(), settings: settings);
      
      case RoutePaths.splash:
        return MaterialPageRoute(builder: (_) => const SplashView(), settings: settings);
      
      case RoutePaths.signup:
        return MaterialPageRoute(builder: (_) => const SignupView(), settings: settings);

      case RoutePaths.bottomNavBar:
        return MaterialPageRoute(builder: (_) =>  BottomNavBar(), settings: settings);
      
      default:
        return MaterialPageRoute(builder: (_) => Scaffold(
          body: Center(child: Text("No route defined for ${settings.name}"),),
        ));
      
    }

  }
}