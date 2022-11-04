import 'package:shared_preferences/shared_preferences.dart';

import '../common/constants/config.dart';

class MysharedServices {
  //setters
  void setSharedPhone(String value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(CacheConfig.phone, value);
  }

  void setSharedToken(String value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(CacheConfig.token, value);
  }

  void setSharedName(String value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(CacheConfig.name, value);
  }

  //getters

  Future<String?> getSharedPhone() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(CacheConfig.phone);
  }

  Future<String?> getSharedToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(CacheConfig.token);
  }

  Future<String?> getSharedName() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(CacheConfig.name);
  }

  //Remove

  removeSharedData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
