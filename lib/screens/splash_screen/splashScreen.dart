import 'dart:async';
import 'package:clean_app/screens/openOnBoard/on_board_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    Timer(
        Duration(seconds: 3),
            () =>
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (BuildContext context) => Onboarding())));

    return Scaffold(
      body: Stack(
        children : [
          Container(
            height: queryData.size.height,
            width: queryData.size.width,
            child: Image.asset("asset/images/splash.png" , fit: BoxFit.fill,),
          ),
          Center(child: Container(
            child: Image.asset("asset/images/logo.png" , ),
          )),
        ]


      ),
    );
  }
}
