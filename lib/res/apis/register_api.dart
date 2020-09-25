import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:philial/res/apis/profile_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

//final String ipAddress = 'https://philial.org:8081/';
final String ipAddress = 'https://192.168.0.21:8081/';
final String URL = '${ipAddress}api/';
var accesstoken, refreshToken;
SharedPreferences localStorage;

Future<String> requestToken(String phonev, String passwordv) async {

  accesstoken = null;
  String clientId = 'testjwtclientid';
  String clientSecret = 'XY7kmzoNzl100';
  String basicAuth =
      'Basic ' + base64Encode(utf8.encode('$clientId:$clientSecret'));

  print('Basic auth $basicAuth');


  http.Response response = await http.post(
      '${ipAddress}oauth/token?grant_type=password&username=$phonev&password=$passwordv',
      headers: <String, String>{'authorization': basicAuth});
  if (response.statusCode == 200) {
    var jsonResponse = json.decode(response.body);
    accesstoken = jsonResponse['access_token'];
    refreshToken=jsonResponse['refresh_token'];

    //print(response.body);
    phonev = null;
    passwordv = null;
//    print('ended token');
  }

  localStorage = await SharedPreferences.getInstance();
  localStorage.setString('mytoken', accesstoken);
  localStorage.setString('refreshToken', refreshToken);

  print('Access token is:... $accesstoken');

  return accesstoken;
}

Future<dynamic> postData(data, apiUrl) async {

  var fullUrl = URL + apiUrl;
  return await http.post(fullUrl,
      body: jsonEncode(data), headers: _setHeaders());
}

Future<dynamic> getData(apiUrl) async {

  var fullUrl = URL + apiUrl;
  return await http.get(fullUrl, headers: _setHeaders());
}

Future<dynamic> putData(data, apiUrl) async {

  var fullUrl = URL + apiUrl;
  return await http.put(fullUrl,
      headers: _setHeaders(), body: jsonEncode(data));
}

Future<dynamic> deleteData(apiUrl) async {

  var fullUrl = URL + apiUrl;
  return await http.delete(fullUrl, headers: _setHeaders());
}

_setHeaders() => {
  'Authorization': 'Bearer $accesstoken',
  'Content-type': 'application/json',
  'Accept': 'application/json',
};

Future<dynamic> registerPostData(data, apiUrl) async {
  var fullUrl = URL + apiUrl;
  return await http.post(fullUrl,
      body: jsonEncode(data), headers: _registerSetHeaders());
}

_registerSetHeaders() => {
  'Content-type': 'application/json',
  'Accept': 'application/json',
};

Future<dynamic> resetPassword(data, apiUrl) async {
  var fullUrl = apiUrl;
  return await http.post(fullUrl,
      body: jsonEncode(data), headers: _registerSetHeaders());
}

Future<dynamic> changePassword(data, apiUrl) async {
  var fullUrl = apiUrl;
  return await http.post(fullUrl,
      body: jsonEncode(data), headers: _setHeaders());
}
