import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceHandler {
  final SharedPreferences prefs;

  SharedPreferenceHandler(this.prefs);

  Future<void> save<T>(String key, T value) async {
    if (T is String) {
      await prefs.setString(key, value as String);
    } else if (T is int) {
      await prefs.setInt(key, value as int);
    } else if (T is double) {
      await prefs.setDouble(key, value as double);
    } else if (T is bool) {
      await prefs.setBool(key, value as bool);
    } else {
      await prefs.setString(key, '${value ?? ''}');
    }
  }

  T? get<T>(String key) {
    if (T is String) {
      return prefs.getString(key) as T?;
    } else if (T is int) {
      return prefs.getInt(key) as T?;
    } else if (T is double) {
      return prefs.getDouble(key) as T?;
    } else if (T is bool) {
      return prefs.getBool(key) as T?;
    } else {
      return prefs.getString(key) as T?;
    }
  }
}
