import 'package:fael_khair/Screens/home_page.dart';
import 'package:fael_khair/Screens/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:fael_khair/http.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: camel_case_types
class SignIn_page extends StatefulWidget {
  @override
  _SignIn_pageState createState() => _SignIn_pageState();
}

// ignore: camel_case_types
class _SignIn_pageState extends State<SignIn_page> {
  void initState() {
    super.initState();
  }

  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();
  @override
  // ignore: override_on_non_overriding_member
  void showBar(BuildContext context, String msg) {
    var bar = SnackBar(
      content: Text(msg),
    );

    Scaffold.of(context).showSnackBar(bar);
  }

  // ignore: override_on_non_overriding_member
  final _formKey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    final data = MediaQuery.of(context);
    int check;

    // ignore: non_constant_identifier_names
    Future<void> login(BuildContext context) async {
      SharedPreferences sharedpreference =
          await SharedPreferences.getInstance();
      var result = await get_login('api/users/login', {
        "email": email.text,
        "password": password.text,
      });

      if (result.ok) {
        setState(() {
          check = result.data['check'];
          if (check == 1) {
            sharedpreference.setString("token", result.data['token']);
            sharedpreference.setString("user_id", result.data['id']);
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                    builder: (BuildContext context) => MyHomePage()),
                (Route<dynamic> route) => false);
          }
          if (check == 2) {
            String res = result.data['error'];
            showBar(context, res);
          }
          if (check == 3) {
            String res = result.data['error'];
            showBar(context, res);
          }
        });
      }
    }

    return Scaffold(
        body: Builder(
      builder: (context) => Form(
        key: _formKey,
        child: ListView(
          children: <Widget>[
            Container(
              height: 350,
              width: 350,
              margin: EdgeInsets.only(
                left: data.padding.left + 20,
                right: data.padding.right + 20,
                top: data.padding.top + 20,
              ),
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/2.png"), fit: BoxFit.contain),
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
            Center(
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 25),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                width: data.size.width * 0.9,
                decoration: BoxDecoration(
                  color: Color(0xFFF1E6FF),
                  borderRadius: BorderRadius.circular(29),
                ),
                child: TextFormField(
                  cursorColor: Color(0xFF6F35A5),
                  controller: email,
                  decoration: InputDecoration(
                    labelText: "Email or user Name",
                    border: InputBorder.none,
                  ),
                  keyboardType: TextInputType.text,
                 
                  // ignore: missing_return
                  validator: (value) {
                    if (value.isEmpty) {
                      return "please enter your email";
                    }
                  },
                ),
              ),
            ),
            Center(
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
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
                  keyboardType: TextInputType.text,
                  
                  // ignore: missing_return
                  validator: (value) {
                    if (value.isEmpty) {
                      return "please enter your password";
                    }
                  },
                ),
              ),
            ),
            Center(
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                width: data.size.width * 0.6,
                decoration: BoxDecoration(
                  color: Color(0xFFF1E6FF),
                  borderRadius: BorderRadius.circular(29),
                ),
                child: FlatButton(
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      setState(() {
                        login(context);
                      });
                    }
                  },
                  child: Text(
                    "Sign In",
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
              ),
            ),
            Center(
              child: Text(
                "New User ? Signup Please",
                style: TextStyle(fontSize: 20.0),
              ),
            ),
            Center(
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 35),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                width: data.size.width * 0.6,
                decoration: BoxDecoration(
                  color: Color(0xFFF1E6FF),
                  borderRadius: BorderRadius.circular(29),
                ),
                child: FlatButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return SignUp_page();
                      }),
                    );
                  },
                  child: Text(
                    "SignUP",
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
