import 'dart:convert';

import 'package:philial/res/apis/register_api.dart';
import 'package:shared_preferences/shared_preferences.dart';

String name;
String phone;
SharedPreferences localStorage;
String email;

getProfileData() async {
  try {
    localStorage = await SharedPreferences.getInstance();
    name = localStorage.getString('name');
    phone = localStorage.getString('phone');
    email = localStorage.getString('email');
  } catch (e) {
  }
}
