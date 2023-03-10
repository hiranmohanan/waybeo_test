import 'package:flutter/material.dart';
import 'package:waybeo_app/requirmrnts/GlobalData.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> sundayhis=[];
  List<String> mondayhis=[];
  List<String> tuesdayhis=[];
  List<String> wednesdayhis=[];
  List<String> thursdaydayhis=[];
  List<String> fridaydayhis=[];
  List<String> saturdayhis=[];



  List<String> sundaych=[];
  List<String> mondaych=[];
  List<String> tuesdaych=[];
  List<String> wednesdaych=[];
  List<String> thursdaydaych=[];
  List<String> fridaydaych=[];
  List<String> saturdaych=[];
 
  List<String> Sunday = [
    "sun",
    "false",
    "false",
    "false",
    "false",
  ];
  List<String> Monday = [
    "mon",
    "false",
    "false",
    "false",
    "false",
  ];
  List<String> Tuesday = [
    "tu",
    "false",
    "false",
    "false",
    "false",
  ];
  List<String> wednesday = [
    "wed",
    "false",
    "false",
    "false",
    "false",
  ];
  List<String> Thuesday = [
    "thu",
    "false",
    "false",
    "false",
    "false",
  ];
  List<String> Friday = [
    "fri",
    "false",
    "false",
    "false",
    "false",
  ];
  List<String> Saturday = [
    "sat",
    "false",
    "false",
    "false",
    "false",
  ];
  int i=0;
  bool state = false;
  bool isloded=false;
  List<String> change=[];
  void initState() {
    super.initState();
    dataoncall();
  }

  dataoncall() async {
    setState(() {
      isloded=true;
    });
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.getStringList("sunday") != null
        ? Globaldata.Sunday = pref.getStringList("sunday")!.toList()
        : {};
    pref.getStringList("monday") != null
        ? Globaldata.Monday = pref.getStringList("monday")!.toList()
        : {};
    pref.getStringList("tuesday") != null
        ? Globaldata.Tuesday = pref.getStringList("tuesday")!.toList()
        : {};
    pref.getStringList("wednesday") != null
        ? Globaldata.wednesday = pref.getStringList("wednesday")!.toList()
        : {};
    pref.getStringList("thuesday") != null
        ? Globaldata.Thuesday = pref.getStringList("thuesday")!.toList()
        : {};
    pref.getStringList("frinday") != null
        ? Globaldata.Friday = pref.getStringList("friday")!.toList()
        : {};
    pref.getStringList("saturday") != null
        ? Globaldata.Saturday = pref.getStringList("saturday")!.toList()
        : {};
        sundayhis.addAll(Globaldata.Sunday);
        mondayhis.addAll(Globaldata.Monday);
        tuesdayhis.addAll(Globaldata.Tuesday);
        wednesdayhis.addAll(Globaldata.Sunday);
        thursdaydayhis.addAll(Globaldata.Sunday);
        fridaydayhis.addAll(Globaldata.Sunday);
        saturdayhis.addAll(Globaldata.Sunday);
        setState(() {
      isloded=false;
    });

  }

  @override
  Widget build(BuildContext context) {
    if (isloded) {
      return SizedBox();
    } else {
      return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: AlwaysScrollableScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
            ),
           const Text(
              "Set Your Weekly Hours",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TheRow(Sunday),
            ),
            SizedBox(
              height: 10,
            ),
            TheRow(Monday),
            SizedBox(
              height: 10,
            ),
            TheRow(Tuesday),
            SizedBox(
              height: 10,
            ),
            TheRow(wednesday),
            SizedBox(
              height: 10,
            ),
            TheRow(Thuesday),
            SizedBox(
              height: 10,
            ),
            TheRow(Friday),
            SizedBox(
              height: 10,
            ),
            TheRow(Saturday),
            SizedBox(
              height: 10,
            ),
            
            TextButton(
                onPressed: () async {
                                    SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  prefs.setStringList("sunday", Sunday);
                  prefs.setStringList("monday", Monday);
                  prefs.setStringList("tuesday", Tuesday);
                  prefs.setStringList("wednesday", wednesday);
                  prefs.setStringList("thuesday", Thuesday);
                  prefs.setStringList("friday", Friday);
                  prefs.setStringList("saturday", Saturday);
                  prefs.setBool("currentstate",Globaldata.stats);
                  compareData();
                  setState(() {
                    

                  });
                
             
                
                   
                   
                  
                  // Navigator.pop(context);
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.red,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 90),
                    child: Text(
                      "Save",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                )),
                //  if(i>=1)...{
                //       Column(children: [
                //         Text("updated day"),
                //         for(int n=0;n<=4;n++)...[
                //           if(Globaldata.Monday[n]!=Monday[n])...   {
                //             n==2?
                //             Text("last updated monday morning"):SizedBox(),
                //             n==3?
                //             Text("last updated monday afternoon"):SizedBox(),
                //             n==4?
                //             Text("last updated monday evening"):SizedBox(),
                //           }
                            
                //         ],
                        
                //       ],),
                //     },
updatedDaySunday(),
                // ListView.builder(
                
                //   shrinkWrap: true,
                //   // scrollDirection: Axis.horizontal,
                //   itemCount: change.length,
                //   itemBuilder: (BuildContext context, int index) {
                //     return SingleChildScrollView(
                //       scrollDirection: Axis.horizontal,
                //       child: Text(change[index]),
                //     );
                //   },
                // ),
          ],
        ),
      ),
    );
    }
  }

  Widget updatedDaySunday() {
    
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      physics: NeverScrollableScrollPhysics(),
            itemCount: Sunday.length,
            itemBuilder: (BuildContext context, int index) {
              
              return Column(children: [
                
              index==0?Text(""):
              Sunday[index]!=Globaldata.Sunday[index]?
              Text("updated list sunday"+Globaldata.Day[index]):SizedBox(),
              
              ],);
            },
          );
  }
  Widget updatedDayMonday() {
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      physics: NeverScrollableScrollPhysics(),
            itemCount: Sunday.length,
            itemBuilder: (BuildContext context, int index) {
              return Column(children: [
        
              index==0?Text(""):
              Monday[index]!=Globaldata.Monday[index]?
              Text("updated list sunday"+Globaldata.Day[index].toString()):SizedBox(),
              
              ],);
            },
          );
  }
  Widget updatedDayTuesday() {
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      physics: NeverScrollableScrollPhysics(),
            itemCount: Sunday.length,
            itemBuilder: (BuildContext context, int index) {
              return Column(children: [
        
              index==0?Text(""):
              Tuesday[index]!=Globaldata.Tuesday[index]?
              Text("updated list sunday"+Globaldata.Day[index].toString()):SizedBox(),
              
              ],);
            },
          );
  }

  Widget TheRow(List today) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          InkWell(
              onTap: (() async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                today[1] == "false"
                    ? setState(() {
                        today[1] = "True";
                        Globaldata.stats = true;
                        change.add('${today[0]}');
                        state = true;
                        prefs.setBool("state", true);
                        print("globalstate" + Globaldata.stats.toString());
                      })
                    : setState(
                        () {
                          today[1] = "false";
                          Globaldata.stats = false;
                           change.remove('${today[0]}');
                          state = false;
                          prefs.setBool("state", false);
                          print("globalstate" + Globaldata.stats.toString());
                        },
                      );
    
                print("shared" + prefs.getBool("state").toString());
              }),
              child: Icon(
                Icons.task_alt_sharp,
                color: today[1] == "false" ? Colors.grey : Colors.green,
              )),
          Text(
            today[0],
            style: TextStyle(
                color: Colors.black, fontSize: 15, fontWeight: FontWeight.w400),
          ),
          today[1] == "True"
              ? Padding(
                  padding: const EdgeInsets.only(left: 20, right: 90),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: InkWell(
                          onTap: () {
                            today[2] == "false"
                                ? setState(() {
                                    today[2] = "True";
                                     change.add("morning");
                                  })
                                : setState(
                                    () {
                                      today[2] = "false";
                                       change.remove('morning');
                                    },
                                  );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                    color: today[2] == "false"
                                        ? Colors.grey
                                        : Colors.pinkAccent)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Morning",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: today[2] == "false"
                                        ? Colors.grey
                                        : Colors.pinkAccent),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: InkWell(
                          onTap: () {
                            today[3] == "false"
                                ? setState(() {
                                    today[3] = "True";
                                     change.add('afternoon');
                                  })
                                : setState(
                                    () {
                                      today[3] = "false";
                                      change.remove('afternoon');
                                    },
                                  );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                    color: today[3] == "false"
                                        ? Colors.grey
                                        : Colors.pinkAccent)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "AfterNoon",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: today[3] == "false"
                                        ? Colors.grey
                                        : Colors.pinkAccent),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: InkWell(
                          onTap: () {
                            today[4] == "false"
                                ? setState(() {
                                    today[4] = "True";
                                    change.add('evening');
                                  })
                                : setState(
                                    () {
                                      today[4] = "false";
                                      change.remove('evening');
                                    },
                                  );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                    color: today[4] == "false"
                                        ? Colors.grey
                                        : Colors.pinkAccent)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Evening",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: today[4] == "false"
                                        ? Colors.grey
                                        : Colors.pinkAccent),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              : Center(
                  child: Text(
                    "Unavilable",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
        ],
      ),
    );
  }
  compareData(){
   Globaldata.Sunday.asMap().forEach((index, value) {
    if(value!=sundayhis[index]){
      sundaych.add(value);
      print("sunday ch ${sundaych[index]}");
    }
    });
  }
}
