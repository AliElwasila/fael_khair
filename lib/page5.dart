import 'package:flutter/material.dart';
class Page5 extends StatefulWidget {
  @override
  _Page5State createState() => _Page5State();
}

class _Page5State extends State<Page5> {
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
                      image: AssetImage('images/image5.jpg'), fit: BoxFit.fill),
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.deepPurpleAccent, Colors.deepPurple])),
              child:Center(
                child:  Text("اخرى",style: TextStyle(color: Colors.white ,fontSize: 35),),
              ),
            ),
            Container(
              height: data.size.height,
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
