import 'package:fael_khair/Screens/missons_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class Notifications_Page extends StatefulWidget {
  @override
  _Notifications_PageState createState() => _Notifications_PageState();
}

// ignore: camel_case_types
class _Notifications_PageState extends State<Notifications_Page> {
  @override
  Widget build(BuildContext context) {
    final data = MediaQuery.of(context);
    return Scaffold(
        body: CustomScrollView(
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
            "Notifications",
            style: TextStyle(fontSize: 25),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              var n = 8;
              if (index >= n) return null;
              return notificatiosList();
            },
            childCount: 8,
          ),
        )
      ],
    ));
  }

  Widget notificatiosList() => Container(
    height: 100,
    margin: EdgeInsets.all(20.0),
        child: Card(
          child: ListTile(
            contentPadding: EdgeInsets.all(10.0),
            leading: CircleAvatar(
              maxRadius: 30,
              backgroundImage: AssetImage("images/mazin.JPG"),
            ),
            title: Text("User22 Has just Joined your Mission",style: TextStyle(fontSize: 18),),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return Missons_page();
                }),
              );
            },
          ),
        ),
      );
/* Container(
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
                backgroundImage: AssetImage("images/mazin.JPG"),
                maxRadius: 40,
              ),
              SizedBox(
                width: 100,
              ),
              Text("this is the title"),
            ],
          ),
          Container(
            height: 150,
            child: Text("this is a massion"),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Icon(Icons.thumb_up),
              Icon(Icons.turned_in_not),
              Icon(Icons.add_circle_outline)
            ],
          )
        ],
      ),
    ),
  );*/
}
