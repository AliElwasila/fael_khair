import 'package:fael_khair/Screens/about_page.dart';
import 'package:fael_khair/Screens/donate_page.dart';
import 'package:fael_khair/Screens/gifts_page.dart';
import 'package:fael_khair/Screens/notifications_page.dart';
import 'package:fael_khair/Screens/settings.dart';
import 'package:fael_khair/Screens/sign_in.dart';
import 'package:fael_khair/Screens/sponsors_page.dart';
import 'package:fael_khair/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'page_Viewer.dart';
import 'profile.dart';
import 'package:flutter/material.dart';
import 'missons_page.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
void initState(){
  super.initState();
  checkLoginState();
  det();
}
  final double barHeight = 66.0;
  SharedPreferences sharedpreference;
  checkLoginState() async {
    sharedpreference = await SharedPreferences.getInstance();
    if (sharedpreference.getString("token") == null) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (BuildContext context) => SignIn_page()),
          (Route<dynamic> route) => false);
    }
  }
  // ignore: non_constant_identifier_names
  TextEditingController user_name = TextEditingController();
  TextEditingController email = TextEditingController();

  // ignore: non_constant_identifier_names
  Future<void> det() async {
    sharedpreference = await SharedPreferences.getInstance();
    var userId = sharedpreference.getString("user_id");
    var result = await user("https://faelkhair.herokuapp.com/api/users/$userId");
    if (result.ok) {
      setState(() {
        user_name.text = result.data['name'];
        email.text = result.data['email'];
      });


    } else {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (BuildContext context) => SignIn_page()),
          (Route<dynamic> route) => false);
    }

}


  // Future<void> Email(BuildContext context) async {
  //   sharedpreference = await SharedPreferences.getInstance();
  //   var userId = sharedpreference.getString("user_id");
  //   var result = await user("localhost:7000/api/users/$userId");
  //   if (result.ok) {
  //     setState(() {
  //      return email = result.data['email'];
  //     });
  //   } else {
  //     Navigator.of(context).pushAndRemoveUntil(
  //         MaterialPageRoute(builder: (BuildContext context) => SignIn_page()),
  //         (Route<dynamic> route) => false);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final data = MediaQuery.of(context);
    // ignore: non_constant_identifier_names
    final DrawerHeader = UserAccountsDrawerHeader(
      decoration: BoxDecoration(
        color: Colors.transparent
      ),
      arrowColor: Colors.transparent,
      margin: EdgeInsets.all(10),
      onDetailsPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return Profile();
          }),
        );
      },
      accountName: Text(
        user_name.text,
        style: TextStyle(fontSize: 25),
      ),
      accountEmail: Text(
        email.text,
        style: TextStyle(fontSize: 20),
      ),
      currentAccountPicture: CircleAvatar(
        radius: 20.0,
        //maxRadius: 100,
        backgroundImage: AssetImage("images/mazin.JPG"),
      ),
    );
    final drawerItems = Container(
      padding: EdgeInsets.only(
        top: data.padding.top,
        bottom: data.padding.bottom,
      ),
      color: Color(0xFF6F35A5),
      //Color(0xFFce93d8),
      child: ListView(
        children: <Widget>[
          DrawerHeader,
          ListTile(
            leading: Icon(
              Icons.post_add,
              size: 25,
              color: Colors.white,
            ),
            title: Text(
              "Missions",
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return Missons_page();
                }),
              );
            },
          ),
          ListTile(
            leading: Icon(
              Icons.notifications_active,
              size: 25,
              color: Colors.white,
            ),
            title: Text(
              "Notifications",
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return Notifications_Page();
                }),
              );
            },
          ),
          ListTile(
            leading: Icon(
              Icons.clean_hands,
              size: 25,
              color: Colors.white,
            ),
            title: Text(
              "Donate",
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return Donate_page();
                }),
              );
            },
          ),
          ListTile(
            leading: Icon(
              Icons.card_giftcard,
              size: 25,
              color: Colors.white,
            ),
            title: Text(
              "Gifts",
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return Gifts_page();
                }),
              );
            },
          ),
          ListTile(
            leading: Icon(
              Icons.supervisor_account_sharp,
              size: 25,
              color: Colors.white,
            ),
            title: Text(
              "Sponsors",
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return Sponsors_page();
                }),
              );
            },
          ),
          ListTile(
            leading: Icon(
              Icons.details,
              size: 25,
              color: Colors.white,
            ),
            title: Text(
              "About Fael Khair",
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return About_page();
                }),
              );
            },
          ),
          ListTile(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return Settings();
                }),
              );
            },
            leading: Icon(
              Icons.settings,
              size: 25,
              color: Colors.white,
            ),
            title: Text(
              "Settings",
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.exit_to_app,
              size: 25,
              color: Colors.white,
            ),
            title: Text(
              "Exit",
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );

    //var data = MediaQuery.of(context);

    return Scaffold(
      backgroundColor:
          Color(0xFF6F35A5), //Color(0xFF7b1fa2),// Color(0xFFE1BEE7),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: <Widget>[
          InkWell(
            child: Icon(
              Icons.search,
              size: 25,
            ),
            onTap: () {},
          ),
        ],
      ),
      extendBodyBehindAppBar: true,
      drawer: Drawer(
        child: drawerItems,
      ),
      body: sideMenu(context),
    );
  }
}

Widget sideMenu(BuildContext context) {
  final data = MediaQuery.of(context);
  return Container(
      width: data.size.width,
      height: data.size.height,
      child: Container(
        padding: EdgeInsets.only(
          top: data.padding.top + 10,
          bottom: data.padding.bottom + 10,
          left: data.padding.left + 75,
        ),
        child: ListView(
          children: <Widget>[
            view("الصحة", "images/image4.png", context, 0),
            view("التعليم", "images/image3.jpg", context, 1),
            view("الإطعام", "images/image5.jpg", context, 2),
            view("التعمير", "images/image1.jpg", context, 3),
            view("اخرى", "images/image2.jpg", context, 4),
          ],
        ),
      ));
}

Widget view(textv, imagev, BuildContext context, nav) {
  var data = MediaQuery.of(context);
  return InkWell(
    onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PageViewer(
              initialPage: nav ,
            ))
          );
    },
    child: Container(
      width: data.size.width * 3 / 4,
      height: data.size.height * 1 / 4.5,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [Colors.blue, Colors.yellow]),
        image: DecorationImage(
          image: AssetImage(imagev),
          fit: BoxFit.fill,
          colorFilter: ColorFilter.srgbToLinearGamma(),
        ),
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Text(
        textv,
        style: TextStyle(
            fontSize: 35, color: Colors.white, fontWeight: FontWeight.bold),
      ),
    ),
    //elevation: 10.0,
    // color: Colors.deepPurpleAccent,
  );
}
