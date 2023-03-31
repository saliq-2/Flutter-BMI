import 'package:flutter/material.dart';
class bmi_info extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Info"),

      ),
      body:Center(
        child: Text(
        "Body Mass Index (BMI) is a measurement of a person’s weight with respect to his or her height. It is more of an indicator than a direct measurement of a person’s total body fatBMI, more often than not, correlates with total body fat. This means that as the BMI score increases, so does a person’s total body fat."
        ,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
      ) ,
    );
  }

}