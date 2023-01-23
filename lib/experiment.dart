import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:waybeo_app/requirmrnts/GlobalData.dart';



List<List<bool>> tasks = List.generate(7, (_) => [false, false, false]);
  String updateText = "";
  DateTime selectedDate = DateTime.now();
  final formatter = DateFormat('yyyy-MM-dd');
  String lastUpdated = "";
  var db = openDatabase('mydb.db');

  Future<Database> openDb() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, 'tasks.db');

    return await openDatabase(
      path,
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE Tasks(id INTEGER PRIMARY KEY, date TEXT, task INTEGER, status INTEGER)",
        );
      },
      version: 1,
    );
  }
String tt='';
List<String> ltp=[];
class tabletasks extends StatefulWidget {
  const tabletasks({super.key});

  @override
  State<tabletasks> createState() => _tabletasksState();
}

class _tabletasksState extends State<tabletasks> {
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
                 
                  setState(() {
                    Globaldata.Sunday=Sunday;
                    Globaldata.Monday=Monday;
                    Globaldata.Thuesday=Tuesday;
                    Globaldata.wednesday=wednesday;
                    Globaldata.Thuesday=Thuesday;
                    Globaldata.Friday=Friday;
                    Globaldata.Saturday=Saturday;

                  });
                  compareData();
                 
             
                
                   
                   
                  
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
                
                  Text(ltp.toString()+"\n"),
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
              
                today[1] == "false"
                    ? setState(() {
                        today[1] = "True";
                        Globaldata.stats = true;
                        change.add('${today[0]}');
                        state = true;
                       
                        print("globalstate" + Globaldata.stats.toString());
                      })
                    : setState(
                        () {
                          today[1] = "false";
                          Globaldata.stats = false;
                           change.remove('${today[0]}');
                          state = false;
                     
                          print("globalstate" + Globaldata.stats.toString());
                        },
                      );
    
               
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
                                  setState(() {
                                    today==Sunday?sundaych.add('morning'):{};
                                    today==Monday?mondaych.add('morning'):{};
                                    today==Tuesday?tuesdaych.add('morning'):{};
                                    today==wednesday?wednesdaych.add('morning'):{};
                                    today==Thuesday?thursdaydaych.add('morning'):{};
                                    today==Friday?fridaydaych.add('morning'):{};
                                    today==Saturday?saturdaych.add('morning'):{};
                                   
                                  });
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
                                  setState(() {
                                    today==Sunday?sundaych.add('afternoon'):{};
                                    today==Monday?mondaych.add('afternoon'):{};
                                    today==Tuesday?tuesdaych.add('afternoon'):{};
                                    today==wednesday?wednesdaych.add('afternoon'):{};
                                    today==Thuesday?thursdaydaych.add('afternoon'):{};
                                    today==Friday?fridaydaych.add('afternoon'):{};
                                    today==Saturday?saturdaych.add('afternoon'):{};
                                   
                                  });
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
                                  setState(() {
                                    today==Sunday?sundaych.add('evening'):{};
                                    today==Monday?mondaych.add('evening'):{};
                                    today==Tuesday?tuesdaych.add('evening'):{};
                                    today==wednesday?wednesdaych.add('evening'):{};
                                    today==Thuesday?thursdaydaych.add('evening'):{};
                                    today==Friday?fridaydaych.add('evening'):{};
                                    today==Saturday?saturdaych.add('morning'):{};
                                   
                                  });
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
              :const Center(
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
  //  Globaldata.Sunday.asMap().forEach((index, value) {
    
  //   if(value!=sundayhis[index]){
      
  //   }
  //   });
      ltp.clear();
      // sundaych.add(value);
      String tt="sunday ${sundaych}(last updated:${sundaych[sundaych.length-1]})";
      print(tt);
      ltp.add(tt);
      sundaych.clear();
  }
  dataChange(){
    
    sundaych!=null?{
      Text("sunday"),
    sundaych.asMap().forEach((key, value) {
       Text("$sundaych[index");
    },)
    }
   :{};
    mondaych!=null?{
      Text("monday"),
    sundaych.asMap().forEach((key, value) {
       Text("$mondaych[index");
    },)
    }
   :{};
  }
}
