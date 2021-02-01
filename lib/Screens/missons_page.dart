import 'package:fael_khair/Screens/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fael_khair/http.dart';

class Missons_page extends StatefulWidget {
  @override
  _Missons_pageState createState() => _Missons_pageState();
}

class _Missons_pageState extends State<Missons_page> {
  void initState() {
    super.initState();
    checkLoginState();
    getUserMission();
    // isLike();
  }

  SharedPreferences sharedpreference;

  checkLoginState() async {
    sharedpreference = await SharedPreferences.getInstance();
    if (sharedpreference.getString("token") == null) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (BuildContext context) => SignIn_page()),
          (Route<dynamic> route) => false);
    }
  }

  List missionData;
  // List liker;
  // bool islike;
  bool _hasBeenPressed = false;
  bool _hasBeenPressed2 = false;
  bool _hasBeenPressed3 = false;
  Future<void> getUserMission() async {
    sharedpreference = await SharedPreferences.getInstance();
    var user_id = sharedpreference.getString("user_id");
    var token = sharedpreference.getString("token");
    print(user_id);
    var result = await get_user_mission(token, "api/mission/user/$user_id");
    if (result.ok) {
      setState(() {
        missionData = result.data['Mission'];
      });
    } else {}
  }

  // Future<void> isLike() async {
  //   sharedpreference = await SharedPreferences.getInstance();
  //   var user_id = sharedpreference.get("user_id");
  //   var result = await getlike("api/liker/$user_id");
  //   if (result.ok) {
  //     liker = result.data['Liker'];
  //   }
  // }

  // Future<void> like_op(dynamic user_mission) async {
  //   sharedpreference = await SharedPreferences.getInstance();
  //   var user_id = sharedpreference.get("user_id");
  //   var result = await like(
  //       "api/liker", {"user_id": user_id, "user_liked_id": user_mission});
  //   if (result.ok) {
  //     setState(() {
  //       liker = result.data['Liker'];
  //     });
  //   }
  // }

  // Future<void> delete_like(dynamic user_mission) async {
  //   sharedpreference = await SharedPreferences.getInstance();
  //   var result = await deletelike("api/liker/$user_mission");
  //   if (result.ok) {
  //     setState(() {});
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    print(missionData);
    final data = MediaQuery.of(context);
    return Scaffold(
        body: missionData == null
            ? Center(child: CircularProgressIndicator())
            : CustomScrollView(
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
                      "Missions",
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
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                                  Text(missionData[index]['title']),
                                ],
                              ),
                              Container(
                                height: 150,
                                child: Text(missionData[index]['description']),
                              ),
                              ButtonBar(
                                alignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  IconButton(
                                      icon: Icon(
                                        Icons.thumb_up,
                                        color: _hasBeenPressed
                                            ? Colors.blue
                                            : Colors.black,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _hasBeenPressed = !_hasBeenPressed;
                                        });
                                      }),
                                  IconButton(
                                      icon: Icon(
                                        Icons.turned_in_not,
                                        color: _hasBeenPressed2
                                            ? Colors.blue
                                            : Colors.black,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _hasBeenPressed2 = !_hasBeenPressed2;
                                        });
                                      }),
                                  IconButton(
                                      icon: Icon(
                                        Icons.add_circle_outline,
                                        color: _hasBeenPressed3
                                            ? Colors.blue
                                            : Colors.black,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _hasBeenPressed3 = !_hasBeenPressed3;
                                        });
                                      }),
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    },
                        childCount:
                            missionData == null ? 0 : missionData.length),
                  )
                ],
              ));
  }

  // Widget listitem(String title, String subtitle, dynamic id) => Container(
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
  //               child: Text(subtitle),
  //             ),
  //             ButtonBar(
  //               alignment: MainAxisAlignment.spaceEvenly,
  //               children: <Widget>[
  //                 // LikeButton(
  //                 //   likeBuilder: (islike) {
  //                 //     liker.forEach((f) {
  //                 //       if (id == liker[f]['user_liked_id']) {
  //                 //         islike = true;
  //                 //       }
  //                 //     });
  //                 //     return Icon(
  //                 //       Icons.thumb_up,
  //                 //       color: islike ? Colors.blue : Colors.grey,
  //                 //     );
  //                 //   },
  //                 //   onTap: (islike) {
  //                 //     liker.forEach((f) {
  //                 //       if (id == liker[f]['user_liked_id']) {
  //                 //         islike = true;
  //                 //       }
  //                 //     });
  //                 //     if (islike = false) {
  //                 //       return like_op(id);
  //                 //     } else {
  //                 //       return delete_like(id);
  //                 //     }
  //                 //   },
  //                 // ),
  //                 IconButton(
  //                   icon: Icon(Icons.thumb_up),
  //                   onPressed: null,
  //                 ),
  //                 IconButton(
  //                   icon: Icon(Icons.turned_in_not),
  //                   onPressed: null,
  //                 ),
  //                 IconButton(
  //                   icon: Icon(Icons.add_circle_outline),
  //                   onPressed: null,
  //                 )
  //               ],
  //             )
  //           ],
  //         ),
  //       ),
  //     );
}
