import 'package:fael_khair/page_Viewer.dart';
import 'package:fael_khair/profile.dart';
import 'package:flutter/material.dart';
import 'missons.dart';
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var data = MediaQuery.of(context);
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar:
      AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: <Widget>[
          InkWell(
            child: Icon(Icons.search,size: 35,),
            onTap: (){
            },
          ),
        ],
      ),
      extendBodyBehindAppBar: true,
      drawer: Drawer(
        elevation: 6.0,
        child: Container(
          padding: data.padding,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/logo.png'), fit: BoxFit.fill),
          ),
          child: ListView(
            padding: data.padding,
            children: <Widget>[
              ListTile(
                title: Text(
                  "Profile",
                  style: TextStyle(fontSize: 27),
                ),
                leading: Icon(
                  Icons.account_box,
                  color: Colors.white,
                  size: 35.0,
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return Profile();
                    }),
                  );
                },
              ),
              ListTile(
                title: Text(
                  "Missons",
                  style: TextStyle(fontSize: 27),
                ),
                leading: Icon(
                  Icons.assignment,
                  color: Colors.white,
                  size: 35.0,
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return Missons();
                    }),
                  );
                },
              ),
              ListTile(
                title: Text(
                  "ITEM 3",
                  style: TextStyle(fontSize: 25),
                ),
                leading: Icon(
                  Icons.person,
                  color: Colors.white,
                  size: 35.0,
                ),
              ),
              ListTile(
                title: Text(
                  "ITEM 4",
                  style: TextStyle(fontSize: 25),
                ),
                leading: Icon(
                  Icons.person,
                  color: Colors.white,
                  size: 35.0,
                ),
              ),
            ],
          ),
        ),
      ),
      body: sideMenu(context),
    );
  }
}

Widget sideMenu(BuildContext context) {
  final data = MediaQuery.of(context);
  return Container(
    padding: EdgeInsets.only(
      left: data.size.width * 1/4 ,
      top: data.padding.top,
      bottom: data.padding.bottom,

    ),
    decoration: BoxDecoration(
      image: DecorationImage(
          image: AssetImage('images/logo.png'), fit: BoxFit.fill),
    ),
    child: ListView(
      padding: EdgeInsets.only(top: 75.0,),
      children: <Widget>[
        InkWell(
          onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return PageViewer(initialPage: 0,);
              }),
            );
          },
          child: Container(
            width: data.size.width * 3/4 ,
            height: data.size.height * 1/4,
            child: Card(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/image1.jpg'), fit: BoxFit.fill),
                  //borderRadius: BorderRadius.circular(14.0),
                ),
              ),
              elevation: 5.0,
              color: Colors.deepPurpleAccent,
              shape: RoundedRectangleBorder(
                //borderRadius: BorderRadius.circular(14.0),
              ),
            ),
          ),
        ),
        InkWell(
          onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return PageViewer(initialPage: 1,);
              }),
            );
          },
          child: Container(
            width: data.size.width * 3/4 ,
            height: data.size.height * 1/4,
            child: Card(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/image2.jpg'), fit: BoxFit.fill),
                  //borderRadius: BorderRadius.circular(14.0),
                ),
              ),
              elevation: 5.0,
              color: Colors.deepPurpleAccent,
              shape: RoundedRectangleBorder(
                //borderRadius: BorderRadius.circular(14.0),
              ),
            ),
          ),
        ),
        InkWell(
          onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return PageViewer(initialPage: 2,);
              }),
            );
          },
          child: Container(
            width: data.size.width * 3/4 ,
            height: data.size.height * 1/4,
            child: Card(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/image3.jpg'), fit: BoxFit.fill),
                  //borderRadius: BorderRadius.circular(14.0),
                ),
              ),
              elevation: 5.0,
              color: Colors.deepPurpleAccent,
              shape: RoundedRectangleBorder(
                //borderRadius: BorderRadius.circular(14.0),
              ),
            ),
          ),
        ),
        InkWell(
          onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return PageViewer(initialPage: 3,);
              }),
            );
          },
          child: Container(
            width: data.size.width * 3/4 ,
            height: data.size.height * 1/4,
            child: Card(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/image4.png'), fit: BoxFit.fill),
                  //borderRadius: BorderRadius.circular(14.0),
                ),
              ),
              elevation: 5.0,
              color: Colors.deepPurpleAccent,
              shape: RoundedRectangleBorder(
                //borderRadius: BorderRadius.circular(14.0),
              ),
            ),
          ),
        ),
        InkWell(
          onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return PageViewer(initialPage: 4,);
              }),
            );
          },
          child: Container(
            width: data.size.width * 3/4 ,
            height: data.size.height * 1/4,
            child: Card(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/image5.jpg'), fit: BoxFit.fill),
                  //borderRadius: BorderRadius.circular(14.0),
                ),
              ),
              elevation: 5.0,
              color: Colors.deepPurpleAccent,
              shape: RoundedRectangleBorder(
                //borderRadius: BorderRadius.circular(14.0),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
