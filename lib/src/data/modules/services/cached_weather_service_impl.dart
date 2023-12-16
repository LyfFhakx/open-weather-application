import 'dart:convert';
import 'package:open_weather_application/src/data/modules/services/local_services/app_shared_prefs.dart';
import '../../../core/error/exceptions.dart';
import '../../../core/locators/service_locator.dart';
import '../../../data.dart';

class CachedWeatherServiceImpl {
  Future<WeatherResponse> getWeather() async {
    try {
      final jsonString = getIt<AppSharedPrefs>().getLocalWeather();
      if (jsonString.isEmpty) {
        throw Exception("No data Error");
      }
      final result = jsonDecode(jsonString);
      return WeatherResponse.fromJson(result);
    } catch (e) {
      throw ServerException(e.toString(), null);
    }
  }
}
