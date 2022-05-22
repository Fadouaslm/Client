import 'package:flutter/material.dart';
import 'dart:async';
import 'package:clientapp/Onboarding.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(milliseconds: 6000),
            () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => OnBoarding()
            )
            )
    );
  }

  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(
        Color(0xffFEE4E4),);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffFEE4E4),
        body: Center(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                      'images/logo1.png'
                  )
              ),
            ),
          ),
        ),
      ),
    );
  }
}