import 'dart:convert';
import 'package:http/http.dart' as http;

class RequestResult {
  bool ok;
  dynamic data;
  RequestResult(this.ok, this.data);
}

const PROTOCOL = "https";
const DOMAIN = "faelkhair.herokuapp.com";

Future<RequestResult> get_login(String route, [dynamic data]) async {
  var datastr = jsonEncode(data);
  var url = "$PROTOCOL://$DOMAIN/$route";
  var result = await http
      .post(url, body: datastr, headers: {"Content-Type": "application/json"});

  return RequestResult(true, jsonDecode(result.body));
}

// ignore: non_constant_identifier_names
Future<RequestResult> http_post(String route, [dynamic data]) async {
  var url = "$PROTOCOL://$DOMAIN/$route";
  var datastr = jsonEncode(data);
  var result = await http
      .post(url, body: datastr, headers: {"Content-Type": "application/json"});
  return RequestResult(true, jsonDecode(result.body));
}

// ignore: non_constant_identifier_names
Future<RequestResult> add_mission(String token, String route,
    [dynamic data]) async {
  var url = "$PROTOCOL://$DOMAIN/$route";
  var datastr = jsonEncode(data);
  var result = await http.post(url,
      body: datastr,
      headers: {"Content-Type": "application/json", "Authorization": "$token"});
  return RequestResult(true, jsonDecode(result.body));
}

Future<RequestResult> user(String route) async {
  var result =
      await http.get(route, headers: {"Content-Type": "application/json"});

  return RequestResult(true, jsonDecode(result.body));
}

Future<RequestResult> get_user_mission(String token, String route) async {
  var url = "$PROTOCOL://$DOMAIN/$route";
  var result = await http.get(url,
      headers: {"Content-Type": "application/json", "Authorization": "$token"});

  return RequestResult(true, jsonDecode(result.body));
}

Future<RequestResult> getcat(String route) async {
  var url = "$PROTOCOL://$DOMAIN/$route";
  var result =
      await http.get(url, headers: {"Content-Type": "application/json"});

  return RequestResult(true, jsonDecode(result.body));
}

Future<RequestResult> like(String route, [dynamic data]) async {
  var url = "$PROTOCOL://$DOMAIN/$route";
  var datastr = jsonEncode(data);
  var result = await http
      .post(url, body: datastr, headers: {"Content-Type": "application/json"});

  return RequestResult(true, jsonDecode(result.body));
}

Future<RequestResult> getlike(String route) async {
  var url = "$PROTOCOL://$DOMAIN/$route";
  var result =
      await http.get(url, headers: {"Content-Type": "application/json"});

  return RequestResult(true, jsonDecode(result.body));
}

Future<RequestResult> deletelike(String route) async {
  var url = "$PROTOCOL://$DOMAIN/$route";
  var result =
      await http.delete(url, headers: {"Content-Type": "application/json"});

  return RequestResult(true, jsonDecode(result.body));
}
