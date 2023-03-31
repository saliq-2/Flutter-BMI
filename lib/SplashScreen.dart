import 'dart:async';

import 'package:bmi/main.dart';
import 'package:flutter/material.dart';
class SplashScreen extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() {
    return SplashScreen_State();

  }

}
class SplashScreen_State  extends State<SplashScreen>
{
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 2), () {
      Navigator.push(context, MaterialPageRoute(builder: (context)=>homepage()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.pinkAccent,
              Colors.blue.shade200,
              Colors.white,

            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,


          )
        ),child: Center(child: Text("BMI",style: TextStyle(fontSize: 30,
          fontWeight: FontWeight.bold),)),
      ),
    );
  }

}
