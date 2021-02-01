import 'package:fael_khair/Screens/page1.dart';
import 'package:fael_khair/Screens/page2.dart';
import 'package:fael_khair/Screens/page3.dart';
import 'package:fael_khair/Screens/page4.dart';
import 'package:fael_khair/Screens/page5.dart';
import 'package:fael_khair/Screens/sign_in.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fael_khair/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddMission extends StatefulWidget {
  @override
  _AddMissionState createState() => _AddMissionState();
}

class _AddMissionState extends State<AddMission> {
  void initState() {
    super.initState();
    checkLoginState();
  }

  final _formKey = GlobalKey<FormState>();
  TextEditingController mission_title = TextEditingController();
  TextEditingController mission_details = TextEditingController();
  TextEditingController mission_location = TextEditingController();
  TextEditingController number = TextEditingController();

  SharedPreferences sharedpreference;
  int back;
  void showBar(BuildContext context, String msg) {
    var bar = SnackBar(
      content: Text(msg),
    );

    Scaffold.of(context).showSnackBar(bar);
  }

  checkLoginState() async {
    sharedpreference = await SharedPreferences.getInstance();
    String catId = sharedpreference.getString("cat_id");
    if (int.tryParse(catId) == 1) {
      return back = 1;
    }
    if (int.tryParse(catId) == 2) {
      return back = 2;
    }
    if (int.tryParse(catId) == 3) {
      return back = 3;
    }
    if (int.tryParse(catId) == 4) {
      return back = 4;
    }
    if (int.tryParse(catId) == 5) {
      return back = 5;
    }
    if (sharedpreference.getString("token") == null) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (BuildContext context) => SignIn_page()),
          (Route<dynamic> route) => false);
    }
  }

  // ignore: non_constant_identifier_names
  Future<void> Add_mission(BuildContext context) async {
    int check;
    sharedpreference = await SharedPreferences.getInstance();
    if (sharedpreference.getString("token") == null) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (BuildContext context) => SignIn_page()),
          (Route<dynamic> route) => false);
    } else {
      String token = sharedpreference.getString("token");
      String catId = sharedpreference.getString("cat_id");
      print(token);
      var result = await add_mission(token, 'api/mission', {
        "title": mission_title.text,
        "description": mission_details.text,
        "location_id": mission_location.text,
        "CategoryId": catId
      });
      if (result.ok) {
        if (result.ok) {
          setState(() {
            check = result.data['check'];
            if (check == 0) {
              String res = result.data['massage'];
              showBar(context, res);
            }
            if (check == 1) {
              String res = result.data['massage'];
              showBar(context, res);
            }
          });
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final data = MediaQuery.of(context);
    return WillPopScope(
        onWillPop: () {
          // ignore: missing_return
          return Navigator.push(context, MaterialPageRoute(builder: (context) {
            if (back == 1) {
              return Page1();
            }
            if (back == 2) {
              return Page2();
            }
            if (back == 3) {
              return Page3();
            }
            if (back == 4) {
              return Page4();
            }
            if (back == 5) {
              return Page5();
            }
          }));
        },
        child: Scaffold(
            body: Form(
          key: _formKey,
          child: CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                pinned: true,
                snap: true,
                floating: true,
                centerTitle: true,
                expandedHeight: data.size.height / 7,
                backgroundColor: Color(0xFF6F35A5),
                flexibleSpace: FlexibleSpaceBar(),
                title: Text(
                  "Add Mission",
                  style: TextStyle(fontSize: 25),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return Container(
                      //padding: EdgeInsets.only(top: 50,left: 50,right: 50),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          /*Container(
                            margin: EdgeInsets.symmetric(vertical: 25),
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 5),
                            width: data.size.width * 0.9,
                            decoration: BoxDecoration(
                              color: Color(0xFFF1E6FF),
                              borderRadius: BorderRadius.circular(29),
                            ),
                            child: DropdownButton(
                              items: null,
                              onChanged: null,
                            ),
                          ),*/
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 10),
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 5),
                            width: data.size.width * 0.9,
                            decoration: BoxDecoration(
                              color: Color(0xFFF1E6FF),
                              borderRadius: BorderRadius.circular(29),
                            ),
                            child: TextFormField(
                              cursorColor: Color(0xFF6F35A5),
                              controller: mission_title,
                              decoration: InputDecoration(
                                labelText: "Mission Title",
                                border: InputBorder.none,
                              ),
                              validator: (value) {
                                if (value.isEmpty)
                                  return 'please enter mission title';
                                return null;
                              },
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 20),
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 5),
                            width: data.size.width * 0.9,
                            height: data.size.height * 1 / 4,
                            decoration: BoxDecoration(
                              color: Color(0xFFF1E6FF),
                              borderRadius: BorderRadius.circular(29),
                            ),
                            child: TextFormField(
                              maxLines: 20,
                              //obscureText: true,
                              //onChanged: onChanged,
                              controller: mission_details,
                              cursorColor: Color(0xFF6F35A5),
                              decoration: InputDecoration(
                                labelText: "Mission Details",
                                border: InputBorder.none,
                              ),
                              validator: (value) {
                                if (value.isEmpty)
                                  return 'please enter mission details';
                                return null;
                              },
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 10),
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 5),
                            width: data.size.width * 0.9,
                            decoration: BoxDecoration(
                              color: Color(0xFFF1E6FF),
                              borderRadius: BorderRadius.circular(29),
                            ),
                            child: TextFormField(
                              controller: mission_location,
                              cursorColor: Color(0xFF6F35A5),
                              decoration: InputDecoration(
                                labelText: "Mission Location",
                                border: InputBorder.none,
                              ),
                              validator: (value) {
                                if (value.isEmpty)
                                  return 'please enter mission location';
                                return null;
                              },
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 10),
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 5),
                            width: data.size.width * 0.9,
                            height: data.size.height * 0.15,
                            decoration: BoxDecoration(
                              color: Color(0xFFF1E6FF),
                              borderRadius: BorderRadius.circular(29),
                            ),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: TextField(
                                    controller: number,
                                    cursorColor: Color(0xFF6F35A5),
                                    decoration: InputDecoration(
                                      labelText: "Number Of Participants",
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                                Expanded(
                                    child: Checkbox(
                                  value: false,
                                  onChanged: null,
                                )),
                                Expanded(
                                    child: Text("Any Number Of Participants")),
                              ],
                            ),
                          ),
                          Center(
                            child: Container(
                              margin: EdgeInsets.symmetric(vertical: 20),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 5),
                              width: data.size.width * 0.6,
                              decoration: BoxDecoration(
                                color: Color(0xFFF1E6FF),
                                borderRadius: BorderRadius.circular(29),
                              ),
                              child: FlatButton(
                                onPressed: () {
                                  if (_formKey.currentState.validate()) {
                                    setState(() {
                                      Add_mission(context);
                                    });
                                  }
                                },
                                child: Text(
                                  "Add Mission",
                                  style: TextStyle(fontSize: 20.0),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  childCount: 1,
                ),
              )
            ],
          ),
        )));
  }
}
