import 'package:bitfx_application/router.dart';
import 'package:bitfx_application/ui/widgets/route_paths.dart';
import 'package:flutter/material.dart' hide Router;
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'router.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: "BIT FX",
        debugShowCheckedModeBanner: false,
        onGenerateRoute: Router.generateRoute,
        initialRoute: RoutePaths.splash,
        theme: ThemeData(
            brightness: Brightness.dark,
            visualDensity: VisualDensity.adaptivePlatformDensity));
  }
}
