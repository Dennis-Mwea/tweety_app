import 'package:data/src/common/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedObjects {
  static late CachedSharedPreferences prefs;
}

class CachedSharedPreferences {
  static SharedPreferences? sharedPreferences;
  static CachedSharedPreferences? instance;
  static final cachedKeyList = {Constants.firstRun, Constants.accessToken};
  static final sessionKeyList = {Constants.accessToken};
  static Map<String, dynamic> map = Map();

  static Future<CachedSharedPreferences> getInstance() async {
    sharedPreferences = await SharedPreferences.getInstance();

    for (String key in cachedKeyList) {
      map[key] = sharedPreferences!.get(key);
    }
    if (instance == null) instance = CachedSharedPreferences();

    return Future.value(instance);
  }

  String? getString(String key) {
    if (cachedKeyList.contains(key)) {
      return map[key];
    }
    return sharedPreferences!.getString(key);
  }

  bool? getBool(String key) {
    if (cachedKeyList.contains(key)) {
      return map[key];
    }
    return sharedPreferences!.getBool(key);
  }

  int? getInt(String key) {
    if (cachedKeyList.contains(key)) {
      return map[key];
    }
    return sharedPreferences!.getInt(key);
  }

  Future<bool> setString(String key, String value) async {
    bool result = await sharedPreferences!.setString(key, value);
    if (result) map[key] = value;
    return result;
  }

  Future<bool> setInt(String key, int value) async {
    bool result = await sharedPreferences!.setInt(key, value);
    if (result) map[key] = value;
    return result;
  }

  Future<bool> setBool(String key, bool value) async {
    bool result = await sharedPreferences!.setBool(key, value);
    if (result) map[key] = value;
    return result;
  }

  Future<void> clearAll() async {
    await sharedPreferences!.clear();
    map = Map();
  }

  Future<void> clearSession() async {
    await sharedPreferences!.remove(Constants.accessToken);
    map.removeWhere((k, v) => (sessionKeyList.contains(k)));
  }
}
