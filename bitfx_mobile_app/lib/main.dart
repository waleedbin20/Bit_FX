import 'package:bitfx_mobile_app/src/ui/widgets/route_paths.dart';

import 'package:flutter/material.dart' hide Router;
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'src/router.dart';

 void main() {
  //  WidgetsFlutterBinding.ensureInitialized();

  //  Firebase.initializeApp();
  runApp(MyApp());
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
      // localizationsDelegates: const [
      //   //AppLocalizations.delegate,
      //   GlobalMaterialLocalizations.delegate,
      //   GlobalWidgetsLocalizations.delegate,
      //   GlobalCupertinoLocalizations.delegate,
      // ],
      //  supportedLocales: const [
      //   Locale('en', ''), // English, no country code
      //   ],
      

      theme: ThemeData(
        brightness: Brightness.dark,
        visualDensity: VisualDensity.adaptivePlatformDensity
      )
    );
  }
}