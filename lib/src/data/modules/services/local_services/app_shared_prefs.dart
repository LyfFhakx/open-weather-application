import 'package:shared_preferences/shared_preferences.dart';

class AppSharedPrefs {
  final SharedPreferences _preferences;

  AppSharedPrefs(this._preferences);

  /// __________ Cached Data __________ ///
  String getLocalWeather() {
    return _preferences.getString("weatherResponse") ?? '';
  }

  void setLocalWeather(String weatherResponse) {
    _preferences.setString("weatherResponse", weatherResponse);
  }
}
