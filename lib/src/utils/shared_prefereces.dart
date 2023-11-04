import 'package:shared_preferences/shared_preferences.dart';

class Preference {
  static Preference? _preferenceHelper;
  static SharedPreferences? _preferences;

  /// sharedPreferences String

  static const onbordingPass = 'onbordingPass';
  static const signupRouterRout = 'signupRouter';
  static const countryCode = 'countryCode';
  static const countryFlag = 'countryFlag';
  static const countryDialCode= 'countryDialCode';

  static getInstance() {
    _preferenceHelper ??= Preference();
    return _preferenceHelper;
  }

  // Obtain shared preferences.
  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();
  static final Map<String, dynamic> _memoryPrefs = <String, dynamic>{};

  /// clear
  static Future<bool> clearPref() async {
    bool clear = await _preferences!.clear();
    if (clear) {
      _memoryPrefs.clear();
    }
    return clear;
  }

  static Future<bool> clearKeyPref(String key) async {
    bool clear = await _preferences!.remove(key);
    if (clear) {
      _memoryPrefs.remove(key);
    }
    return clear;
  }

  /// Setter
  static void setString(String key, String value) {
    _preferences?.setString(key, value);
    _memoryPrefs[key] = value;
  }

  static void setInt(String key, int value) {
    _preferences?.setInt(key, value);
    _memoryPrefs[key] = value;
  }

  static void setDouble(String key, double value) {
    _preferences?.setDouble(key, value);
    _memoryPrefs[key] = value;
  }

  static void setBool(String key, bool value) {
    _preferences?.setBool(key, value);
    _memoryPrefs[key] = value;
  }

  static void setListString(String key, List<String> value) {
    _preferences?.setStringList(key, value);
    _memoryPrefs[key] = value;
  }

  static void setDateTime(String key, DateTime? value) {
    _preferences?.setInt(key, value?.millisecondsSinceEpoch ?? 0);
    _memoryPrefs[key] = value;
  }

  /// Getter

  static String getString(String key, {dynamic def}) {
    String? val;
    if (_memoryPrefs.containsKey(key)) {
      val = _memoryPrefs[key];
    }
    val ??= _preferences?.getString(key);
    val ??= def;
    val ??= '';
    _memoryPrefs[key] = val;
    return val;
  }

  static int getInt(String key, {int? def}) {
    int? val;
    if (_memoryPrefs.containsKey(key)) {
      val = _memoryPrefs[key];
    }
    val ??= _preferences!.getInt(key);
    val ??= def;
    _memoryPrefs[key] = val;
    return val ?? 0;
  }

  static double getDouble(String key, {double? def}) {
    double? val;
    if (_memoryPrefs.containsKey(key)) {
      val = _memoryPrefs[key];
    }
    val ??= _preferences!.getDouble(key);
    val ??= def;
    _memoryPrefs[key] = val;
    return val ?? 0.0;
  }

  static bool getBool(String key, {bool? def = false}) {
    bool? val = def;
    if (_memoryPrefs.containsKey(key)) {
      val = _memoryPrefs[key];
    }
    if (_preferences == null) {
      return val!;
    }
    val = _preferences!.getBool(key);
    val ??= def;
    _memoryPrefs[key] = val;
    return val!;
  }

  static List<String> getListString(String key, {List<String>? def}) {
    List<String>? val;
    if (_memoryPrefs.containsKey(key)) {
      val = _memoryPrefs[key];
    }
    val ??= _preferences!.getStringList(key);
    val ??= def ?? [];
    _memoryPrefs[key] = val;
    return val;
  }

  static DateTime? getDateTime(String key) {
    DateTime? value;
    if (_memoryPrefs.containsKey(key)) {
      value = _memoryPrefs[key];
    } else {
      int? millisecondsSinceEpoch = _preferences?.getInt(key);
      if (millisecondsSinceEpoch != null) {
        value = DateTime.fromMillisecondsSinceEpoch(millisecondsSinceEpoch);
        _memoryPrefs[key] = value;
      }
    }
    return value;
  }

  /// Existing
  static bool exists(String key, {String? def}) {
    return _preferences!.containsKey(key);
  }
}
