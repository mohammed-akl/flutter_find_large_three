import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_find_large_three/screens/home_screen.dart';
import 'package:flutter_find_large_three/utils/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 2),
            () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => HomeScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsUtil.primary_color_white,
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(top:100.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(Icons.calculate_outlined,color: ColorsUtil.primary_color,size: 100.0,),
              Text("Demo App",style: TextStyle(color: ColorsUtil.primary_color,fontSize: 12.0,fontWeight: FontWeight.normal),)
            ],
          ),
        ),
      ),
    );
  }
}