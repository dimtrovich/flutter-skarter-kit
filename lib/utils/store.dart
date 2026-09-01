import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class Store {  
  static Future<Object?> get(String key) async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    return pref.get(key);
  }

  static Future<String?> getString(String key) async {
    var result =  await Store.get(key);
    if (result == null) {
      return null;
    }
    return result as String;
  }
  
  static Future<bool> set(String key, dynamic value) async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    if (value is Map) {
      value = jsonEncode(value);
    }

    if (value is String) {
      return pref.setString(key, value);
    }
    if (value is bool) {
      return pref.setBool(key, value);
    }
    if (value is int) {
      return pref.setInt(key, value);
    }
    if (value is double) {
      return pref.setDouble(key, value);
    }

    return false;
  }

  static Future<bool> remove(String key) async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    return pref.remove(key);
  }

  static Future<bool> has(String key) async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    return pref.containsKey(key);
  }

  static Future<bool> missing(String key) async {
    return await Store.has(key) == false;
  }
}