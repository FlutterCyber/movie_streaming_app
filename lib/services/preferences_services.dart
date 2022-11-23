

import 'package:shared_preferences/shared_preferences.dart';

class Preference {
  static Future<bool> saveUserId(String user_id) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.setString('user_id', user_id);
  }

  static Future<String?> getUserId() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? usr_id = preferences.getString('user_id');
    return usr_id;
  }

  static Future<bool> deleteUserId() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.remove('user_id');
  }
}
