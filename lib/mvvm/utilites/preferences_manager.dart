import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferenceManager{


  Future<bool> putBoolean(String keyValue,bool value) async {
    final prefs = await SharedPreferences.getInstance();

    return await prefs.setBool(keyValue, false);
  }
  Future<bool?> getBoolean(String keyValue) async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.getBool(keyValue);
  }

}