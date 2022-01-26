import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_find_large_three/screens/home_screen.dart';
import 'package:flutter_find_large_three/screens/splash_screen.dart';
import 'package:flutter_find_large_three/utils/colors.dart';
import 'package:flutter_find_large_three/utils/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  String _defaultRoute = Routes.ROUTE_SPLASH;
  runApp(new MyApp(
    defaultRoute: _defaultRoute,
  ));
}

class MyApp extends StatefulWidget {
  String? defaultRoute;

  MyApp({this.defaultRoute});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Large Three',
      theme: ThemeData(
        primarySwatch: generateMaterialColor(Color(0xff191919)),
      ),
      initialRoute: widget.defaultRoute,
      routes: {
        Routes.ROUTE_SPLASH: (context) => SplashScreen(),
        Routes.ROUTE_HOME: (context) => HomeScreen(),
      },
    );
  }
}
