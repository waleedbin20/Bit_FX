// ignore_for_file: unnecessary_null_comparison

import 'package:bitfx_application/core/services/auth_service.dart';
import 'package:bitfx_application/router.dart';
import 'package:bitfx_application/ui/views/home/home_view.dart';
import 'package:bitfx_application/ui/views/splash/splash_view.dart';
import 'package:bitfx_application/ui/widgets/route_paths.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart' hide Router;
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final AuthenticationService auth = AuthenticationService();
  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: "BIT FX",
        debugShowCheckedModeBanner: false,
        onGenerateRoute: Router.generateRoute,
        // initialRoute: RoutePaths.splash,
        home: fire(),
        // home: auth.isSignedIn() ? BottomNavBar() : SplashView(),
        // home: user != null ? BottomNavBar() :SplashView() ,
        theme: ThemeData(
            brightness: Brightness.dark,
            visualDensity: VisualDensity.adaptivePlatformDensity));
  }

  Widget fire() {
    User? user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      return SplashView();
    } else {
      return BottomNavBar();
    }
  }

}
