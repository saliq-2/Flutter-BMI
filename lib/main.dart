import 'dart:async';
import 'dart:math';

import 'package:bmi/SplashScreen.dart';
import 'package:bmi/bmi_info.dart';
import 'package:bmi/bmr_info.dart';
import 'package:flutter/material.dart';

void main()
{
  runApp(myapp());
}

class myapp extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
   return MaterialApp(
     title: "APP",
     theme: ThemeData(
       primarySwatch: Colors.pink,
     ),

     home:SplashScreen() ,
     debugShowCheckedModeBanner: false,

   ) ;

  }

}
class homepage extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() {
    return homepage_state();
  }


}
class homepage_state extends State<homepage>
{
  List<String>  gender=<String>['Male','Female'];
  String? dropdownvalue='Male';


  var weight_controller=TextEditingController();
  var height_controller=TextEditingController();
  var result="";
  var result1;
  var bgcolor;
  var msg="";
  var bmr_weight_controller=TextEditingController();
  var bmr_height_controller=TextEditingController();
  var bmr_age_controller=TextEditingController();
  var bmr;
  String bmr1="";

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 2,
      initialIndex: 0,//Which tab will be default
      child:Scaffold(
        resizeToAvoidBottomInset: true,




     backgroundColor: bgcolor,
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: Text("YourBMI"),
        bottom: TabBar(
          tabs: [
            Tab(text:"BMI",),
            Tab(text: "BMR",),




          ],
        ),

      ),
      drawer: Container(
        width: MediaQuery.of(context).size.width*0.5,
        child: Drawer(
          
          child: ListView(
            //padding: EdgeInsets.only(bottom: 8),
            children: [
              const DrawerHeader(decoration: BoxDecoration(
                color: Colors.white60,


              ),child:CircleAvatar(
                radius: 150,

                backgroundImage: AssetImage("/Users/saliqneyaz/StudioProjects/bmi/assets/Images/food.jpg"),
              ),

              ),
              ListTile(
                leading: Icon(Icons.health_and_safety),
                title: Text("What is BMI?"),
                onTap: (){
                  Navigator.pop(context);
                 Navigator.push(context, MaterialPageRoute(builder: (context)=>bmi_info()));

                },


              ),
              ListTile(
                leading: Icon(Icons.health_and_safety),
                title:Text("What is BMR?") ,
                onTap:(){
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>bmr_info()),);
                } ,
              )
            ],
          ),
        ),
      ),
      body:TabBarView(
        children:[
          Center(
          child: Container(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
             // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("BMI",
                  style: TextStyle(fontWeight:FontWeight.bold,fontSize: 22 ),),
                TextField(
                  controller: height_controller,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    label: Text("Enter your Height(in cm)"),
                    prefixIcon: Icon(Icons.height),
                  ),
                ),
                TextField(
                  controller: weight_controller,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    label: Text("Enter your Weight (in Kgs)"),
                    prefixIcon:Icon(Icons.line_weight),
                  ),
                 // keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height:15 ,
                ),
                ElevatedButton(onPressed: (){
                  var weight=weight_controller.text.toString();
                  var height=height_controller.text.toString();
                  if(weight==""&&height=="")
                    {
                      setState((){
                        result="Please fill";
                      });
                    }
                  else
                    {

                      num height_1=int.parse(height);
                      num weight_1=int.parse(weight);
                      height_1= pow(height_1,2);
                      result1=weight_1/height_1;
                      result1=result1*10000;
                      int my_res=result1.toInt();
                      result=my_res.toString();

                      if(result1>25)
                        {
                          msg="You are over weight";
                          bgcolor=Colors.red.shade200;

                        }
                      else if(result1<18)
                        {
                        msg="You are under weight";
                        bgcolor=Colors.yellow;


                       // bgcolor=Colors.yellow;
                        // InkWell(
                        //
                        // );
                        }
                      else
                        {
                          msg="You are healthy";
                          bgcolor=Colors.green.shade300;
                        }
                      setState((){


                        });


                    }

                }, child: Text("Calculate")),





            SizedBox(
              height: 11,
            ),
              Text("$msg \n         ${result}"),


                SizedBox(
                  height: 20,
                ),
                Text("BMI Categories\n",style: TextStyle(fontWeight: FontWeight.bold),),
                Text("        Under Weight<18 \n       Normal Weight 18-25\n       Over Weight >25\n       Note:BMI >30 is Obesity ")







              ],

            ),
          ),
        ),


          //BMR (BASAL METABOLIC RATE)





          Center(
            child: Container(
              width: double.infinity,
              color: Colors.white,

              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Text("BMR",style:TextStyle(fontSize:22,fontWeight: FontWeight.bold ) ,),
                  SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    width: 300,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: height_controller,

                      decoration: InputDecoration(
                        label: Text("Enter your height (cm)"),
                        prefixIcon: Icon(Icons.height),


                      ),
                    ),
                  ),
                  SizedBox(
                    height:11,),
                  SizedBox(
                    width: 300,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller:weight_controller ,
                      decoration: InputDecoration(
                        label: Text("Enter your weight"),
                        prefixIcon:Icon(Icons.line_weight),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 11,
                  ),


                  SizedBox(
                    width: 300,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: bmr_age_controller,
                      decoration: InputDecoration(
                        label: Text("Enter your age"),
                        prefixIcon: Icon(Icons.child_care),


                      ),
                    ),
                  ),
                  SizedBox(height:20,),
                  DropdownButton(
                   value:dropdownvalue ,

                    items:gender.map((e) => DropdownMenuItem(
                      child: Text(e),value:e ,)).toList(),
                      onChanged:(String? e){
                       setState((){
                        dropdownvalue=e;
                      });

                      },
                  ),
                  ElevatedButton(onPressed: (){
                    if(dropdownvalue=='Female')
                      {

                        var weight =weight_controller.text.toString();
                        var female_weight=int.parse(weight);
                        var female_height=int.parse(height_controller.text.toString());
                        var female_age=int.parse(bmr_age_controller.text.toString());
                         bmr=655+(9.6*female_weight)+(1.8*female_height)-(4.7*female_age);

                         bmr=bmr.toInt();
                        bmr1=bmr.toString();
                      }
                    else{
                      var weight =weight_controller.text.toString();
                      var male_weight=int.parse(weight);
                      var male_height=int.parse(height_controller.text.toString());
                      var male_age=int.parse(bmr_age_controller.text.toString());

                       bmr=66+(13.7*male_weight)+(5*male_height)-(6.8*male_age);
                      bmr= bmr.toInt();
                      bmr1=bmr.toString();






                    }
                    setState(()
                    {}
                    );



                  }, child: Text("Calculate"),
                    style: ElevatedButton.styleFrom(
                    primary:Colors.blue ,
                    //onPrimary: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(11),

                    ),




                  ),),
                  Text("Your Calorie Intake should be:\n                      ${bmr1}",style:TextStyle(fontSize: 15) ,)

                ],
              ),
            ),
          ),

      ],
      ),
    ),
    );
    //);

  }
}

