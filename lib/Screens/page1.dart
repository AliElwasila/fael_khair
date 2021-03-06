
import 'package:fael_khair/Screens/add_mission.dart';
import 'package:fael_khair/Screens/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fael_khair/Screens/sign_in.dart';
import 'package:fael_khair/http.dart';

SharedPreferences sharedpreference;

class Page1 extends StatefulWidget {
  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  void initState() {
    super.initState();
    checkLoginState();
    getmission();
  }

  bool _hasBeenPressed = false;
  bool _hasBeenPressed2 = false;
  bool _hasBeenPressed3 = false;

  SharedPreferences sharedpreference;
  List Data;
  checkLoginState() async {
    sharedpreference = await SharedPreferences.getInstance();
    sharedpreference.setString("cat_id", '1');
    if (sharedpreference.getString("token") == null) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (BuildContext context) => SignIn_page()),
          (Route<dynamic> route) => false);
    }
  }

  Future<void> getmission() async {
    sharedpreference = await SharedPreferences.getInstance();
    var catid = sharedpreference.getString("cat_id");
    var res = await getcat("api/category/$catid");

    if (res.ok) {
      setState(() {
        Data = res.data['Cat'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final data = MediaQuery.of(context);
    return WillPopScope(
        onWillPop: () {
          return Navigator.push(context, MaterialPageRoute(builder: (context) {
            return MyHomePage();
          }));
        },
        child: Scaffold(
          floatingActionButton: FloatingActionButton(
              child: Icon(
                Icons.add_circle,
                size: 45,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return AddMission();
                  }),
                );
              }),
          body: Data == null
              ? Center(child: CircularProgressIndicator())
              : CustomScrollView(
                  slivers: <Widget>[
                    SliverAppBar(
                      pinned: true,
                      snap: true,
                      floating: true,
                      centerTitle: true,
                      expandedHeight: data.size.height / 4,
                      flexibleSpace: FlexibleSpaceBar(
                        background: Image.asset(
                          "images/image4.png",
                          fit: BoxFit.fill,
                        ),
                      ),
                      title: Text(
                        "الصحة",
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                          return Container(
                            width: 250,
                            height: 350,
                            color: Colors.white,
                            child: Card(
                              margin: EdgeInsets.all(10),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              color: Colors.white,
                              elevation: 10,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.max,
                                    //crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      SizedBox(
                                        width: 20,
                                      ),
                                      CircleAvatar(
                                        backgroundImage:
                                            AssetImage("images/mazin.JPG"),
                                        maxRadius: 40,
                                      ),
                                      SizedBox(
                                        width: 100,
                                      ),
                                      Text(Data[index]['title']),
                                    ],
                                  ),
                                  Container(
                                    height: 150,
                                    child: Text(Data[index]['description']),
                                  ),
                                  ButtonBar(
                                    alignment: MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      IconButton(
                                          icon: Icon(
                                            Icons.thumb_up_outlined,
                                            color: _hasBeenPressed
                                                ? Colors.blue
                                                : Colors.black,
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              _hasBeenPressed =
                                                  !_hasBeenPressed;
                                            });
                                          }),
                                      IconButton(
                                          icon: Icon(
                                            Icons.assignment_turned_in_outlined,
                                            color: _hasBeenPressed2
                                                ? Colors.blue
                                                : Colors.black,
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              _hasBeenPressed2 =
                                                  !_hasBeenPressed2;
                                            });
                                          }),
                                      IconButton(
                                          icon: Icon(
                                            Icons.share_outlined,
                                            color: _hasBeenPressed3
                                                ? Colors.blue
                                                : Colors.black,
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              _hasBeenPressed3 =
                                                  !_hasBeenPressed3;
                                            });
                                          }),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        childCount: Data == null ? 0 : Data.length,
                      ),
                    )
                  ],
                ),
        ));
  }
}

// Widget listitem(String title, String desc, bool bress) => Container(
//       width: 250,
//       height: 350,
//       color: Colors.white,
//       child: Card(
//         margin: EdgeInsets.all(10),
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(15.0),
//         ),
//         color: Colors.white,
//         elevation: 10,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: <Widget>[
//             SizedBox(
//               height: 20,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               mainAxisSize: MainAxisSize.max,
//               //crossAxisAlignment: CrossAxisAlignment.center,
//               children: <Widget>[
//                 SizedBox(
//                   width: 20,
//                 ),
//                 CircleAvatar(
//                   backgroundImage: AssetImage("images/mazin.JPG"),
//                   maxRadius: 40,
//                 ),
//                 SizedBox(
//                   width: 100,
//                 ),
//                 Text(title),
//               ],
//             ),
//             Container(
//               height: 150,
//               child: Text(desc),
//             ),
//             ButtonBar(
//               alignment: MainAxisAlignment.spaceEvenly,
//               children: <Widget>[
//                 IconButton(
//                     icon: Icon(
//                       Icons.star,
//                       color: bress ? Colors.blue : Colors.black,
//                     ),
//                     onPressed: () {
//                       changecolor
//                     }),
//                 IconButton(icon: Icon(Icons.turned_in_not), onPressed: null),
//                 IconButton(
//                     icon: Icon(Icons.add_circle_outline), onPressed: null),
//               ],
//             )
//           ],
//         ),
//       ),
//     );
