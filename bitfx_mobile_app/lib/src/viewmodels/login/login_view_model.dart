

import 'package:flutter/material.dart';

import '../../ui/widgets/route_paths.dart';

class LoginViewModel extends ChangeNotifier {

  String username = "username";
  String password = "password";

  


  Future login(BuildContext context)async {
   await Navigator.pushNamed(context, RoutePaths.login);
   notifyListeners();

  }

  Future HomeSreen(BuildContext context)async {
   await Navigator.pushNamed(context, RoutePaths.bottomNavBar);
   notifyListeners();

  }

  Future signIn(String username, String password) async {

    username = username;
    password = password;
    notifyListeners();

  }
  
  }

  
