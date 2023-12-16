import 'models.dart';


class Weather {
  final int? dt;
  final Main? main;
  final List<WeatherCondition>? weather;
  final Clouds? clouds;
  final Wind? wind;
  final int? visibility;
  final double? pop;
  final DateTime? dtTxt;
  final Rain? rain;

  Weather ({
    this.dt,
    this.main,
    this.weather,
    this.clouds,
    this.wind,
    this.visibility,
    this.pop,
    this.dtTxt,
    this.rain,
  });

  factory Weather .fromJson(Map<String, dynamic> json) => Weather (
    dt: json["dt"],
    main: json["main"] == null ? null : Main.fromJson(json["main"]),
    weather: json["weather"] == null ? [] : List<WeatherCondition>.from(json["weather"]!.map((x) => WeatherCondition.fromJson(x))),
    clouds: json["clouds"] == null ? null : Clouds.fromJson(json["clouds"]),
    wind: json["wind"] == null ? null : Wind.fromJson(json["wind"]),
    visibility: json["visibility"],
    pop: json["pop"]?.toDouble(),
    dtTxt: json["dt_txt"] == null ? null : DateTime.parse(json["dt_txt"]),
    rain: json["rain"] == null ? null : Rain.fromJson(json["rain"]),
  );

  Map<String, dynamic> toJson() => {
    "dt": dt,
    // "main": main?.toJson(),
    "weather": weather == null ? [] : List<dynamic>.from(weather!.map((x) => x.toJson())),
    "clouds": clouds?.toJson(),
    "wind": wind?.toJson(),
    "visibility": visibility,
    "pop": pop,
    "dt_txt": dtTxt?.toIso8601String(),
    "rain": rain?.toJson(),
  };
}
