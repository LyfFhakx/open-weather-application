// To parse this JSON data, do
//
//     final weatherResponse = weatherResponseFromJson(jsonString);

import 'dart:convert';

import 'models.dart';

WeatherResponse weatherResponseFromJson(String str) =>
    WeatherResponse.fromJson(json.decode(str));

String weatherResponseToJson(WeatherResponse data) =>
    json.encode(data.toJson());

class WeatherResponse {
  final String cod;
  final int message;
  final int cnt;
  final List<Weather> weatherReport;
  final City city;

  WeatherResponse({
    required this.cod,
    required this.message,
    required this.cnt,
    required this.weatherReport,
    required this.city,
  });

  factory WeatherResponse.fromJson(Map<String, dynamic> json) =>
      WeatherResponse(
        cod: json["cod"],
        message: json["message"],
        cnt: json["cnt"],
        weatherReport: List<Weather>.from(json["list"].map((x) => Weather.fromJson(x))),
        city: City.fromJson(json["city"]),
      );

  Map<String, dynamic> toJson() => {
        "cod": cod,
        "message": message,
        "cnt": cnt,
        "list": List<dynamic>.from(weatherReport.map((x) => x.toJson())),
        "city": city.toJson(),
      };
}
