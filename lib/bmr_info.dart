import 'package:flutter/material.dart';

class bmr_info extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMR Info"),
      ),

      body:Center(
          child: Container(
            padding: EdgeInsets.all(8.0),
              child: Text("Basal metabolic rate (BMR) is often used interchangeably with resting metabolic rate (RMR). While BMR is a minimum number of calories required for basic functions at rest, RMR — also called resting energy expenditure (REE) — is the number of calories that your body burns while it’s at rest."
              ,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
              )
          )
      ) ,

    );

  }
}