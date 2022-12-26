import 'package:flutter/material.dart';
import 'package:waybeo_app/requirmrnts/GlobalData.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
  bool state = false;
  bool isloded=false;
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
        ? Sunday = pref.getStringList("sunday")!.toList()
        : {};
    pref.getStringList("monday") != null
        ? Monday = pref.getStringList("monday")!.toList()
        : {};
    pref.getStringList("tuesday") != null
        ? Tuesday = pref.getStringList("tuesday")!.toList()
        : {};
    pref.getStringList("wednesday") != null
        ? wednesday = pref.getStringList("wednesday")!.toList()
        : {};
    pref.getStringList("thuesday") != null
        ? Thuesday = pref.getStringList("thuesday")!.toList()
        : {};
    pref.getStringList("frinday") != null
        ? Friday = pref.getStringList("friday")!.toList()
        : {};
    pref.getStringList("saturday") != null
        ? Saturday = pref.getStringList("saturday")!.toList()
        : {};
        setState(() {
      isloded=false;
    });

  }

  @override
  Widget build(BuildContext context) {
    return 
    isloded?SizedBox():
    Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: AlwaysScrollableScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
            ),
            Text(
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
                  print(prefs.get("sunday"));
                  print(prefs.get("monday"));
                  print(prefs.get("tuesday"));
                  print(prefs.get("wednesday"));
                  print(prefs.get("thuesday"));
                  print(prefs.get("friday"));
                  print(prefs.get("saturday"));

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
                ))
          ],
        ),
      ),
    );
  }

  Widget TheRow(List today) {
    return Row(
      children: [
        InkWell(
            onTap: (() async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              today[1] == "false"
                  ? setState(() {
                      today[1] = "True";
                      Globaldata.stats = true;
                      state = true;
                      prefs.setBool("state", true);
                      print("globalstate" + Globaldata.stats.toString());
                    })
                  : setState(
                      () {
                        today[1] = "false";
                        Globaldata.stats = false;
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
                                })
                              : setState(
                                  () {
                                    today[2] = "false";
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
                                })
                              : setState(
                                  () {
                                    today[3] = "false";
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
                                })
                              : setState(
                                  () {
                                    today[4] = "false";
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
    );
  }
}
