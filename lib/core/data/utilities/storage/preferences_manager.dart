import 'package:shared_preferences/shared_preferences.dart';

class PreferencesManager {
  PreferencesManager._();

  static late SharedPreferences _pref;

  static Future<void> initPreferences() async {
    _pref = await SharedPreferences.getInstance();
  }

  /// keys
  static const _token = 'token';

  static String? get token => _pref.getString(_token);

  static set token(String? val) {
    if (val == null) {
      _pref.remove(_token);
      return;
    }

    _pref.setString(_token, val);
  }
}
