

import 'package:bitfx_mobile_app/src/ui/widgets/route_paths.dart';
import 'package:flutter/material.dart';

class WelcomeViewModel extends ChangeNotifier{

  final String login = "Login";
  final String signup = "Signup";

  WelcomeViewModel();

  Future<void> onLoginPress (BuildContext context) async {
   await Navigator.pushNamed(context, RoutePaths.login);
   notifyListeners();
  }

  Future<void> onSignUpPress(BuildContext context) async{
    await Navigator.pushNamed(context, RoutePaths.signup);
    notifyListeners();
  }
}