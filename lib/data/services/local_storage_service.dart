import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  static LocalStorageService? _instance;
  static SharedPreferences? _prefs;

  LocalStorageService._();

  static Future<LocalStorageService> getInstance() async {
    _instance ??= LocalStorageService._();
    _prefs ??= await SharedPreferences.getInstance();
    return _instance!;
  }

  // Save data
  Future<bool> saveString(String key, String value) async {
    return await _prefs!.setString(key, value);
  }

  Future<bool> saveMap(String key, Map<String, dynamic> value) async {
    return await _prefs!.setString(key, jsonEncode(value));
  }

  // Read data
  String? getString(String key) {
    return _prefs!.getString(key);
  }

  Map<String, dynamic>? getMap(String key) {
    final data = _prefs!.getString(key);
    if (data != null) {
      return jsonDecode(data) as Map<String, dynamic>;
    }
    return null;
  }

  // Remove data
  Future<bool> remove(String key) async {
    return await _prefs!.remove(key);
  }

  Future<bool> clear() async {
    return await _prefs!.clear();
  }
}
