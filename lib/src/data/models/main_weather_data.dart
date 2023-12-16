
class Main {
  final Temperature? temp;
  final Temperature? tempMin;
  final Temperature? tempMax;
  final int? humidity;
  final Temperature? tempKf;

  Main({
    this.temp,
    this.tempMin,
    this.tempMax,
    this.humidity,
    this.tempKf,
  });

  factory Main.fromJson(Map<String, dynamic> json) => Main(
    temp: Temperature(json["temp"]?.toDouble()),
    tempMin: Temperature(json["temp_min"]?.toDouble()),
    tempMax: Temperature(json["temp_max"]?.toDouble()),
    humidity: json["humidity"],
    tempKf: Temperature(json["temp_kf"]?.toDouble()),
  );

  Map<String, dynamic> toJson() => {
    "temp": temp,
    "temp_min": tempMin,
    "temp_max": tempMax,
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
      ? '${celsius!.toStringAsFixed(1)}º'
      : "No temperature";
}
