import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'Screens/sign_in.dart';

void main() => runApp(FaelKhair());

class FaelKhair extends StatefulWidget {
  @override
  _FaelKhairState createState() => _FaelKhairState();
}

class _FaelKhairState extends State<FaelKhair> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fael Khair',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: AnimatedSplashScreen(
        splash: Image(
          image: AssetImage("images/2.png"),
          width: 350.0,
          height: 350.0,
        ),
        splashIconSize: 350.0,
        //duration: 10000,
        backgroundColor: Colors.transparent,
        //centered: true,
        splashTransition: SplashTransition.fadeTransition,
        animationDuration: Duration(milliseconds: 1000),
        nextScreen: SignIn_page(),
      ),
    );
  }
}
