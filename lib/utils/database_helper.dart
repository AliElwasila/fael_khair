//import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:fael_khair/models/mission_model.dart';

class DatabaseHelper {
  static DatabaseHelper _databaseHelper;
  static Database _database;
  String missionsTable = "missions_table";
  String colId = "id";
  String colTitle = "title";
  String colDetails = "details";
  String colDate = "date";

  DatabaseHelper.createInistance();

  factory DatabaseHelper() {
    if (_databaseHelper == null) {
      _databaseHelper = DatabaseHelper.createInistance();
    }
    return _databaseHelper;
  }

  Future<Database> get database async{
    if(_database == null ){
      _database = await initializeDatabase();
    }
    return _database;
  }

  Future<Database> initializeDatabase() async{
    //get The Directory
    Directory directory = await getApplicationDocumentsDirectory();
    String path = (directory.path + "Missions.db");
    //open || Create database
    var missionsDatabase = await openDatabase(path,version: 1 , onCreate: _createDb);
    return missionsDatabase;
  }

  void _createDb(Database db, int newVersion) async {
    await db.execute(
        "CREATE TABLE $missionsTable($colId INTEGER PRIMARY KEY AUTOINCREMENT , $colTitle TEXT ,$colDetails TEXT , $colDate TEXT)");
  }

 Future<List<Map<String , dynamic>>> getMissionsMapList() async{
    Database db = await this.database;
    var result = db.query(missionsTable,orderBy: "$colId ASC");
  return result;
  }

  Future<int> insertMission(Mission mission) async{
    Database db = await this.database;
    var result = await db.insert(missionsTable, mission.toMap());
    return result;
  }

  Future<int> updateMission(Mission mission) async{
    Database db = await this.database;
    var result = await db.update(missionsTable, mission.toMap(),where: "$colId = ?", whereArgs: [mission.id]);
    return result;
  }

  Future<int> deleteMission(Mission mission) async{
    Database db = await this.database;
    var result = await db.delete(missionsTable,where: "$colId = ?", whereArgs: [mission.id]);
    return result;
  }

  Future<List<Mission>> getMissionList() async{

    var missionMapList = await getMissionsMapList();
    int count = missionMapList.length;
    List<Mission> missionList = List<Mission>();
    for(int i = 0 ; i > count ; i++){
      missionList.add(Mission.FromMapObject(missionMapList[i]));
    }
    return missionList;
  }
}
