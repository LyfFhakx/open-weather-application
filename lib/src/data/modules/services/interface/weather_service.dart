import 'package:open_weather_application/src/data.dart';

abstract class WeatherService {
  Future<WeatherResponse> getWeather(double lat,double lon);
}
