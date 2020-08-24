import 'package:flutter/material.dart';
import 'package:fael_khair/models/mission_model.dart';
import 'package:fael_khair/utils/database_helper.dart';
import 'package:intl/intl.dart';

class AddMission extends StatefulWidget {
  @override
  _AddMissionState createState() => _AddMissionState();
}

class _AddMissionState extends State<AddMission> {
  DatabaseHelper databaseHelper = DatabaseHelper();
  //List<Mission> missionList;
  Mission mission = new Mission();
  TextEditingController titleController = TextEditingController();
  TextEditingController detailsController = TextEditingController();
  @override



  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Mission"),
      ),
      body: ListView(
        padding: EdgeInsets.all(35),
        children: <Widget>[
          TextField(
            controller: titleController,
            onChanged: (value){
              mission.title = titleController.text;
            },
            style: TextStyle(fontSize: 27),
            decoration: InputDecoration(
              //hintText: "Mission Title",
              labelText: "Mission Title",
            ),
          ),
          SizedBox(
            height: 15,
          ),
          TextField(
            controller: detailsController,
            onChanged: (value){
              mission.details = detailsController.text;
            },
            style: TextStyle(fontSize: 27),
            decoration: InputDecoration(
              labelText: "Mission Details",
            ),
            maxLines: 8,
          ),
          SizedBox(
            height: 35,
          ),
          FlatButton(
            onPressed: () {
              setState(() {
                _save();
              });
            },
            color: Colors.blue,
            child: Text(
              "Add",
              style: TextStyle(fontSize: 25),
            ),
          ),
        ],
      ),
    );
  }
  void _save() async {
   mission.date = DateFormat.yMMMd().format(DateTime.now());
  mission.title = titleController.text;
  mission.details = detailsController.text;
   mission = Mission.newObject(mission.title,mission.details,mission.date);


    int result;

    //if (mission.id == null) {
      result = await databaseHelper.insertMission(mission);
      print("your title"+mission.title);
      print("your details "+mission.details);
      print("your date"+mission.date);
    //}
    if(result != 0  ){
      _showAlertDialog("Status","Saved Successfully $result");
    }
    else{
      _showAlertDialog("Status","Note not Saved $result ");
    }
    //Navigator.pop(context);
  }
  _showAlertDialog(String title , String message){
    AlertDialog alertDialog = AlertDialog(
      title: Text(title),
      content: Text(message),
    );
    showDialog(context: context,
        builder: (_) => alertDialog
    );
  }
}
