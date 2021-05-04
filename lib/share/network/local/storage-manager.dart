import 'package:shared_preferences/shared_preferences.dart';

class StorageManager {
  static SharedPreferences prefs;
  static init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static Future saveData(String key, dynamic value) async {
    if (value is int) {
      await prefs.setInt(key, value);
    } else if (value is String) {
      await prefs.setString(key, value);
    } else if (value is bool) {
      await prefs.setBool(key, value);
    } else {
      print("Invalid Type");
    }
  }

  static bool readBool(String key){

    return prefs.getBool(key);
  }

  static Future<bool> deleteData(String key) async {
    return await prefs.remove(key);
  }
}
