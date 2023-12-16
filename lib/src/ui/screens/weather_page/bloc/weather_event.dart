part of 'weather_bloc.dart';

sealed class WeatherEvent extends Equatable {
  const WeatherEvent();
}

final class GetWeatherEvent extends WeatherEvent {
  final double lat;
  final double lon;

  const GetWeatherEvent(this.lat, this.lon);

  @override
  List<Object?> get props => [];
}

final class GetLocationEvent extends WeatherEvent {
  const GetLocationEvent();

  @override
  List<Object?> get props => [];
}
