class Main {
  final Temperature temp;
  final Temperature feelsLike;
  final Temperature tempMin;
  final Temperature tempMax;
  final int seaLevel;
  final int grndLevel;
  final int humidity;
  final double tempKf;

  Main({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.seaLevel,
    required this.grndLevel,
    required this.humidity,
    required this.tempKf,
  });

  factory Main.fromJson(Map<String, dynamic> json) => Main(
        temp: Temperature(json["temp"]?.toDouble()),
        feelsLike: Temperature(json["feels_like"]?.toDouble()),
        tempMin: Temperature(json["temp_min"]?.toDouble()),
        tempMax: Temperature(json["temp_max"]?.toDouble()),
        seaLevel: json["sea_level"],
        grndLevel: json["grnd_level"],
        humidity: json["humidity"],
        tempKf: json["temp_kf"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "temp": temp,
        "feels_like": feelsLike,
        "temp_min": tempMin,
        "temp_max": tempMax,
        "sea_level": seaLevel,
        "grnd_level": grndLevel,
        "humidity": humidity,
        "temp_kf": tempKf,
      };
}

class Temperature {
  final double? _kelvin;

  Temperature(this._kelvin);

  /// Convert temperature to Kelvin
  double? get kelvin => _kelvin;

  /// Convert temperature to Celsius
  double? get celsius => _kelvin != null ? _kelvin! - 273.15 : null;

  /// Convert temperature to Fahrenheit
  double? get fahrenheit =>
      _kelvin != null ? _kelvin! * (9 / 5) - 459.67 : null;

  @override
  String toString() => celsius != null
      ? '${celsius!.toStringAsFixed(1)} Celsius'
      : "No temperature";
}
