import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:bmi/main.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
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
    Timer(Duration(seconds: 4), () {

      Navigator.push(context, MaterialPageRoute(builder: (context)=>homepage()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Lottie.network("https://assets3.lottiefiles.com/packages/lf20_3bdtoWyH6z.json"),

            // decoration: BoxDecoration(
            //   gradient: LinearGradient(
            //     colors: [
            //       Colors.pinkAccent,
            //       Colors.blue.shade200,
            //       Colors.white,
            //
            //     ],
            //     begin: Alignment.topCenter,
            //     end: Alignment.bottomCenter,
            //
            //
            //   )
            // ),child: Center(child: Text("BMI",style: TextStyle(fontSize: 30,
            //   fontWeight: FontWeight.bold),)),
          ),

          //Text("YourBMI",style: TextStyle(fontSize:45,color: Colors.pinkAccent),),
          AnimatedTextKit(
            animatedTexts: [
              TypewriterAnimatedText("BMI",textStyle: TextStyle(fontSize: 32,color: Colors.pinkAccent),
            // duration: Duration(milliseconds: 500),
             speed: Duration(milliseconds: 900),

              )
            ],
          )

        ],

      ),
    );
  }

}
