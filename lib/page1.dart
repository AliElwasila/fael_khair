import 'package:flutter/material.dart';
class Page1 extends StatefulWidget {
  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  var _currecy = ["Dollar", "SDG", "Pound"];
  var _currentItemSelected = "Dollar";
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
                      image: AssetImage('images/image1.jpg'), fit: BoxFit.fill),
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.deepPurpleAccent, Colors.deepPurple])),
              child:Center(
                child:  Text("الصحة",style: TextStyle(color: Colors.white ,fontSize: 35),),
              ),
            ),
            Container(
              width: data.size.width,
              padding: data.padding,
              child: Row(
                children: <Widget>[
                  Expanded(child: DropdownButton(
                    icon: Icon(Icons.attach_money),
                    items: _currecy.map((String dropDownStringItem) {
                      return DropdownMenuItem<String>(
                        value: dropDownStringItem,
                        child: Text(dropDownStringItem),
                      );
                    }).toList(),
                    onChanged: (String newValueSelected){
                      setState(() {
                        this._currentItemSelected = newValueSelected;
                      });
                    },
                    value: _currentItemSelected,

                  ),),
                  Expanded(child: DropdownButton(
                    icon: Icon(Icons.attach_money),
                    items: _currecy.map((String dropDownStringItem) {
                      return DropdownMenuItem<String>(
                        value: dropDownStringItem,
                        child: Text(dropDownStringItem),
                      );
                    }).toList(),
                    onChanged: (String newValueSelected){
                      setState(() {
                        this._currentItemSelected = newValueSelected;
                      });
                    },
                    value: _currentItemSelected,

                  ),),
                  Expanded(child: DropdownButton(
                    icon: Icon(Icons.attach_money),
                    items: _currecy.map((String dropDownStringItem) {
                      return DropdownMenuItem<String>(
                        value: dropDownStringItem,
                        child: Text(dropDownStringItem),
                      );
                    }).toList(),
                    onChanged: (String newValueSelected){
                      setState(() {
                        this._currentItemSelected = newValueSelected;
                      });
                    },
                    value: _currentItemSelected,

                  ),),
                ],
              ),
            ),
              Container(
              width: data.size.width * 3/4 ,
                height: data.size.height * 1/4,
              child:Card(
                elevation: 6.0,
                child:Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        CircleAvatar(
                          backgroundColor: Colors.black,
                          radius: 45,
                          backgroundImage: AssetImage('images/mazin.JPG'),
                        ),
                        Container(width: 50,),
                        Text("This the title of the Mission")
                      ],
                    ),
                    Text("The mission Describtion"),
                    Container(height: 70,),
                    Row(
                        //crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.library_music,size: 45,),
                          Container(width: 70,),
                          Icon(Icons.library_music,size: 45,),
                          Container(width: 70,),
                          Icon(Icons.library_music,size: 45,),
                        ],
                      ),
                  ],
                )
              ),
              ),
                  Container(
                    width: data.size.width * 3/4 ,
                    height: data.size.height * 1/4,
                    child:Card(
                        elevation: 6.0,
                        child:Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                CircleAvatar(
                                  backgroundColor: Colors.black,
                                  radius: 45,
                                  backgroundImage: AssetImage('images/mazin.JPG'),
                                ),
                                Container(width: 50,),
                                Text("This the title of the Mission")
                              ],
                            ),
                            Text("The mission Describtion"),
                            Container(height: 70,),
                            Row(
                              //crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(Icons.library_music,size: 45,),
                                Container(width: 70,),
                                Icon(Icons.library_music,size: 45,),
                                Container(width: 70,),
                                Icon(Icons.library_music,size: 45,),
                              ],
                            ),
                          ],
                        )
                    ),
                  ),
                  Container(
                    width: data.size.width * 3/4 ,
                    height: data.size.height * 1/4,
                    child:Card(
                        elevation: 6.0,
                        child:Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                CircleAvatar(
                                  backgroundColor: Colors.black,
                                  radius: 45,
                                  backgroundImage: AssetImage('images/mazin.JPG'),
                                ),
                                Container(width: 50,),
                                Text("This the title of the Mission")
                              ],
                            ),
                            Text("The mission Describtion"),
                            Container(height: 70,),
                            Row(
                              //crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(Icons.library_music,size: 45,),
                                Container(width: 70,),
                                Icon(Icons.library_music,size: 45,),
                                Container(width: 70,),
                                Icon(Icons.library_music,size: 45,),
                              ],
                            ),
                          ],
                        )
                    ),
                  ),
                  Container(
                    width: data.size.width * 3/4 ,
                    height: data.size.height * 1/4,
                    child:Card(
                        elevation: 6.0,
                        child:Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                CircleAvatar(
                                  backgroundColor: Colors.black,
                                  radius: 45,
                                  backgroundImage: AssetImage('images/mazin.JPG'),
                                ),
                                Container(width: 50,),
                                Text("This the title of the Mission")
                              ],
                            ),
                            Text("The mission Describtion"),
                            Container(height: 70,),
                            Row(
                              //crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(Icons.library_music,size: 45,),
                                Container(width: 70,),
                                Icon(Icons.library_music,size: 45,),
                                Container(width: 70,),
                                Icon(Icons.library_music,size: 45,),
                              ],
                            ),
                          ],
                        )
                    ),
                  ),

          ],
        ),
      ),
    );
  }
}
