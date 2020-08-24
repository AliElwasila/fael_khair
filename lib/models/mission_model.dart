
class Mission {
  int _id;
  String _title;
  String _details;
  String _date;
  Mission();
  Mission.newObject(this._title,this._details,this._date);
  Mission.withId(this._id,this._title,this._details,this._date);

  int get id => _id;
  String get title => _title;
  String get details => _details;
  String get date => _date;

  set title(String newTitle){
    this._title = newTitle;
  }

  set details(String newDetails){
    this._details = newDetails;
  }
  set date(String newDate){
    this._date = newDate;
  }

  Map< String , dynamic> toMap(){

    var map = Map<String , dynamic>();

    if(id != null ) {
      map["id"] = _id;
    }
    map["title"] = _title;
    map["details"] = _details;
    map["date"] = _date;

    return map;
  }

  Mission.FromMapObject(Map<String , dynamic> map){
    this._id = map["id"];
    this._title = map["title"];
    this._details = map["details"];
    this._date = map["date"];


  }
}