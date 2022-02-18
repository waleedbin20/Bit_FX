


import 'package:flutter/material.dart';

import '../../ui/widgets/route_paths.dart';

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