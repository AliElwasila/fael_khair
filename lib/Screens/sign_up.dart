import 'package:fael_khair/Screens/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:fael_khair/http.dart';

// ignore: camel_case_types
class SignUp_page extends StatefulWidget {
  @override
  _SignUp_pageState createState() => _SignUp_pageState();
}

// ignore: camel_case_types
class _SignUp_pageState extends State<SignUp_page> {
  @override
  void initState() {
    super.initState();
  }

  TextEditingController name = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();
  final _formKey = GlobalKey<FormState>();
  Widget build(BuildContext context) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    final data = MediaQuery.of(context);

    int check;
    // ignore: non_constant_identifier_names
    Future CreateUser(BuildContext context) async {
      var result = await http_post("api/users/register", {
        "firstname": name.text,
        "email": email.text,
        "password": password.text,
      });
      if (result.ok) {
        setState(() {
          check = result.data['check'];
          if (check == 1) {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return SignIn_page();
            }));
          }
          if (check == 4) {
            String res = result.data['massage'];
            final snackBar = SnackBar(
              content: Text('$res'),
            );
            Scaffold.of(context).showSnackBar(snackBar);
          }
          if (check == 2) {
            String res = result.data['massage'];
            final snackBar = SnackBar(
              content: Text('$res'),
            );
            Scaffold.of(context).showSnackBar(snackBar);
          }
        });
      }
    }

    return Scaffold(
        body: Builder(
            builder: (context) => Form(
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
                          "Sign Up",
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
                                  Container(
                                    margin: EdgeInsets.symmetric(vertical: 25),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 5),
                                    width: data.size.width * 0.9,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFF1E6FF),
                                      borderRadius: BorderRadius.circular(29),
                                    ),
                                    child: TextFormField(
                                      cursorColor: Color(0xFF6F35A5),
                                      controller: name,
                                      decoration: InputDecoration(
                                        labelText: "User Name",
                                        border: InputBorder.none,
                                      ),
                                      
                                      // ignore: missing_return
                                      validator: (value) {
                                        if (value.isEmpty)
                                          return 'please enter your name';
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
                                      cursorColor: Color(0xFF6F35A5),
                                      controller: email,
                                      decoration: InputDecoration(
                                        labelText: "Email",
                                        border: InputBorder.none,
                                      ),
                                      
                                      validator: (value) {
                                        if (value.isEmpty)
                                          return 'please enter your Email';
                                        // if (!regex.hasMatch(value))
                                        //   return 'Enter Valid Email';
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
                                      cursorColor: Color(0xFF6F35A5),
                                      decoration: InputDecoration(
                                        labelText: "Confirm Email",
                                        border: InputBorder.none,
                                      ),
                                      validator: (value) {
                                        if (value.isEmpty)
                                          return 'please enter your Email';
                                        if (value != email.text)
                                          return 'Not Match';
                                        return null;
                                      },
                                    ),
                                  ),
                                  Container(
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
                                      controller: password,
                                      cursorColor: Color(0xFF6F35A5),
                                      obscureText: true,
                                      decoration: InputDecoration(
                                        labelText: "Password",
                                        border: InputBorder.none,
                                      ),
                                      
                                      validator: (value) {
                                        if (value.isEmpty){
                                          return 'please enter your Password';
                                        }
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
                                      cursorColor: Color(0xFF6F35A5),
                                      obscureText: true,
                                      decoration: InputDecoration(
                                        labelText: "Confirm Password",
                                        border: InputBorder.none,
                                      ),
                                      validator: (value) {
                                        if (value.isEmpty)
                                          return 'please enter your Password';
                                        if (value != password.text)
                                          return 'Not Match';
                                        return null;
                                      },
                                    ),
                                  ),
                                  Center(
                                    child: Container(
                                      margin:
                                          EdgeInsets.symmetric(vertical: 20),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 5),
                                      width: data.size.width * 0.6,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFF1E6FF),
                                        borderRadius: BorderRadius.circular(29),
                                      ),
                                      child: FlatButton(
                                        onPressed: () {
                                          if (_formKey.currentState
                                              .validate()) {
                                            setState(() {
                                              CreateUser(context);
                                            });
                                          }
                                        },
                                        child: Text(
                                          "Register",
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
