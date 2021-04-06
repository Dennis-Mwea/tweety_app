import 'package:shared_preferences/shared_preferences.dart';
import 'package:tweety_app/config/Constants.dart';

class SharedObjects {
  static late CachedSharedPreferences prefs;

  static int getTypeFromPathType(String type) {
    List<String> importantPart = type.split('\\');

    if (importantPart.last == 'NewMessageNotification')
      return 0;
    else if (importantPart.last == 'OpportunityDeletedNotification')
      return 1;
    else if (importantPart.last == 'EventReminderNotification')
      return 2;
    else if (importantPart.last == 'EventConfirmationNotification')
      return 3;
    else if (importantPart.last == 'OpportunityUpdatedNotification')
      return 4;
    else if (importantPart.last == 'EventDeletedNotification')
      return 5;
    else
      throw UnimplementedError('This type is not handled.');
  }
}

class CachedSharedPreferences {
  static SharedPreferences? sharedPreferences;
  static CachedSharedPreferences? instance;
  static int themeIndexPref = 0;
  static final cachedKeyList = {Constants.firstRun, Constants.accessToken, Constants.refreshToken, Constants.expiresIn};

  static final sessionKeyList = {Constants.accessToken, Constants.refreshToken, Constants.firstRun};

  static Map<String, dynamic> map = Map();

  static Future<CachedSharedPreferences> getInstance() async {
    sharedPreferences = await SharedPreferences.getInstance();

    if (sharedPreferences!.getBool(Constants.firstRun) == null) {
      // if first run, then set these values
      await sharedPreferences!.setBool(Constants.firstRun, false);
    }
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
    await sharedPreferences!.remove(Constants.refreshToken);
    await sharedPreferences!.remove(Constants.expiresIn);
    map.removeWhere((k, v) => (sessionKeyList.contains(k)));
  }
}
