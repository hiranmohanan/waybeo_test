

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:waybeo_app/home_Screen.dart';
import 'package:waybeo_app/requirmrnts/GlobalData.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();

}

class _SplashScreenState extends State<SplashScreen> {

@override
void initState() {
  super.initState();
  getdata();
}
bool isloaded=false;
bool current=false;
bool iscolumn=false;
 List<String>? sunday=[];   
 List<String>? monday=[];   
 List<String>? tuesday=[];   
 List<String>? wednesday=[];   
 List<String>? thuesday=[];   
 List<String>? friday=[];   
 List<String>? saturday=[];   
 List <String> days=["sunday","monday","tuesday","wednesday","thuesday","friday","saturday"];
getdata() async {
  setState(() {
    isloaded=true;
  });
  SharedPreferences pref=await SharedPreferences.getInstance();
                pref.getBool("satate");
                sunday=pref.getStringList("sunday");
                monday=pref.getStringList("monday");
                tuesday=pref.getStringList("tuesday");
                wednesday=pref.getStringList("wednesday");
                thuesday=pref.getStringList("thuesday");
                friday=pref.getStringList("fridayday");
                saturday=pref.getStringList("saturday");
                
                print(pref.getBool("satate"));
                print("global"+Globaldata.stats.toString());
                setState(() {
                  pref.getBool("state")!=null?
                Globaldata.stats=pref.getBool("state")!:{};
    isloaded=false;
  });
}
  @override
  Widget build(BuildContext context) {

    return isloaded?Center(child: CircularProgressIndicator(),):(
   Container(
        color: Colors.white,
        child: Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            physics: AlwaysScrollableScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(),
                TextButton(onPressed: () async {
                  SharedPreferences pref=await SharedPreferences.getInstance();
                  pref.getBool("satate");
                  sunday=pref.getStringList("sunday");
                  monday=pref.getStringList("monday");
                  tuesday=pref.getStringList("tuesday");
                  wednesday=pref.getStringList("wednesday");
                  thuesday=pref.getStringList("thuesday");
                  friday=pref.getStringList("fridayday");
                  saturday=pref.getStringList("saturday");
                  print(pref.getBool("state"));
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
                }, child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10,bottom: 10,left: 20,right: 20),
                    child: Text(Globaldata.stats?"Edit Schedule":"Add Schedule."),
                  ),
                )),
                TextButton(onPressed: () async {
                  SharedPreferences pref=await SharedPreferences.getInstance();
                  pref.getBool("satate");
                  sunday=pref.getStringList("sunday");
                  monday=pref.getStringList("monday");
                  tuesday=pref.getStringList("tuesday");
                  wednesday=pref.getStringList("wednesday");
                  thuesday=pref.getStringList("thuesday");
                  friday=pref.getStringList("fridayday");
                  saturday=pref.getStringList("saturday");
                  print("sunday"+sunday.toString());
                  print(pref.getBool("state"));
                  setState(() {
                    iscolumn=true;
                  });
                  
                }, child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10,bottom: 10,left: 20,right: 20),
                    child: Text("show Schedule"),
                  ),
                )),
                iscolumn?
                ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: days.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        days[index][2]=="true"?
                        Text("You are free in" +days[index] +"morning",style: TextStyle(color: Colors.black),):SizedBox(),
                        days[index][3]=="true"?
                        Text("You are free in" +days[index] +"afternoon",style: TextStyle(color: Colors.black)):SizedBox(),
                        days[index][4]=="true"?
                        Text("You are free in" +days[index] +"evening",style: TextStyle(color: Colors.black)):SizedBox(),
                      ],
                    );
                  },
                ):SizedBox(),
               
                
              ],
            ),
          ),
        ),
      )
    );
  }
}