import 'models.dart';

class Weather {
  final int dt;
  final Main main;
  final List<WeatherCondition> weather;
  final Clouds clouds;
  final Wind wind;
  final int visibility;
  final double pop;
  final Rain? rain;
  final DateTime dtTxt;

  Weather({
    required this.dt,
    required this.main,
    required this.weather,
    required this.clouds,
    required this.wind,
    required this.visibility,
    required this.pop,
    this.rain,
    required this.dtTxt,
  });

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        dt: json["dt"],
        main: Main.fromJson(json["main"]),
        weather: List<WeatherCondition>.from(
            json["weather"].map((x) => WeatherCondition.fromJson(x))),
        clouds: Clouds.fromJson(json["clouds"]),
        wind: Wind.fromJson(json["wind"]),
        visibility: json["visibility"],
        pop: json["pop"]?.toDouble(),
        rain: json["rain"] == null ? null : Rain.fromJson(json["rain"]),
        dtTxt: DateTime.parse(json["dt_txt"]),
      );

  Map<String, dynamic> toJson() => {
        "dt": dt,
        "main": main.toJson(),
        "weather": List<dynamic>.from(weather.map((x) => x.toJson())),
        "clouds": clouds.toJson(),
        "wind": wind.toJson(),
        "visibility": visibility,
        "pop": pop,
        "rain": rain?.toJson(),
        "dt_txt": dtTxt.toIso8601String(),
      };
}
