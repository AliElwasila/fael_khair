import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    TextEditingController name = new TextEditingController();
    TextEditingController email = new TextEditingController();
    TextEditingController password = new TextEditingController();
    bool _notifications = false;
    final data = MediaQuery.of(context);
    return Scaffold(
        body: Builder(
      builder: (context) => CustomScrollView(
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
              "Settings",
              style: TextStyle(fontSize: 25),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Center(
                        child: Container(
                          padding: EdgeInsets.all(10.0),
                          height: 150.0,
                          width: 150.0,
                          child: GestureDetector(
                            child: CircleAvatar(
                              backgroundImage: AssetImage("images/mazin.JPG"),
                            ),
                            onTap: () {
                              debugPrint("Change pic");
                            },
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 25),
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                        width: data.size.width * 0.9,
                        decoration: BoxDecoration(
                          color: Color(0xFFF1E6FF),
                          borderRadius: BorderRadius.circular(29),
                        ),
                        child: TextFormField(
                          cursorColor: Color(0xFF6F35A5),
                          controller: name,
                          decoration: InputDecoration(
                            labelText: "Update User Name",
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                        width: data.size.width * 0.9,
                        decoration: BoxDecoration(
                          color: Color(0xFFF1E6FF),
                          borderRadius: BorderRadius.circular(29),
                        ),
                        child: TextFormField(
                          cursorColor: Color(0xFF6F35A5),
                          controller: email,
                          decoration: InputDecoration(
                            labelText: "Update Email",
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                        width: data.size.width * 0.9,
                        decoration: BoxDecoration(
                          color: Color(0xFFF1E6FF),
                          borderRadius: BorderRadius.circular(29),
                        ),
                        child: TextFormField(
                          controller: password,
                          cursorColor: Color(0xFF6F35A5),
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: "Update Password",
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                        width: data.size.width * 0.9,
                        decoration: BoxDecoration(
                          color: Color(0xFFF1E6FF),
                          borderRadius: BorderRadius.circular(29),
                        ),
                        child: SwitchListTile(
                          title: Text('Notifications'),
                          value: _notifications,
                          onChanged: (bool value) {
                            setState(() {
                              _notifications = value;
                            });
                          },
                          secondary: const Icon(Icons.notifications_active),
                        ),
                      ),
                      Center(
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: 20),
                          padding:
                              EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                          width: data.size.width * 0.6,
                          decoration: BoxDecoration(
                            color: Color(0xFFF1E6FF),
                            borderRadius: BorderRadius.circular(29),
                          ),
                          child: FlatButton(
                            onPressed: () {},
                            child: Text(
                              "Confirm Updates",
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
    ));
  }
}
