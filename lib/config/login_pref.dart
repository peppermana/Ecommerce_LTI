import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPref {
  //save the preference/session
  //used for login
  static saveToSharedPref(String idUser, String username) async {
    //membaca disk dalam perangkat/ atau membuka sharedpref terlebih dahulu
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //simpan data dengan tipe data string ke sharedpref
    prefs.setString("id_user", idUser);
    prefs.setString("username", username);
  }

  //check the existance of preference/session
  static Future<bool> checkpref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    //cek apakah di dalam sharedpref terdapat data yang mengandung key "id user"
    // jika betul ada maka akan mengembalikan nilai true, sebaliknya kembalikan nilai false
    bool checkValue = prefs.containsKey("id_user");
    return checkValue;
  }

  //for logout
  static Future<bool> removePref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();
    return true;
  }

  static Future<Map<String, String>> getValuePref() async {
    return SharedPreferences.getInstance().then((SharedPreferences sp) {
      return {
        "id_user": sp.getString("id_user")!,
        "username": sp.getString("username")!,
      };
    });
    // SharedPreferences preferences = await SharedPreferences.getInstance();
    // // getString = ambil nilai dari sharedPref
    // return {
    //   "id user" : preferences.getString("id user")!,
    //   "username" : preferences.getString("username")!,
  }
}
