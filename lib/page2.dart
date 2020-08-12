import 'package:flutter/material.dart';

class Page2 extends StatefulWidget {
  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    final data = MediaQuery.of(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(

        body:ListView(
          padding: data.padding,
          children: <Widget>[
            Container(
              height: data.size.height / 3 ,
              width: data.size.width,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/image2.jpg'), fit: BoxFit.fill),
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.deepPurpleAccent, Colors.deepPurple])),
              child:Center(
                child:  Text("التعليم",style: TextStyle(color: Colors.white ,fontSize: 35),),
              ),
            ),
            Container(
              height: data.size.height  ,
              width: data.size.width,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.white, Colors.deepPurpleAccent])),
              child:Center(
                child:  Text("Container 2",style: TextStyle(color: Colors.black ,fontSize: 25),),
              ),
            ),
            /*Container(
              height: 400,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.white, Colors.deepPurpleAccent])),
              child:Center(
                child:  Text("Number 3",style: TextStyle(color: Colors.black ,fontSize: 25),),
              ),
            ),*/
          ],
        ),
      ),
    );
  }
}
