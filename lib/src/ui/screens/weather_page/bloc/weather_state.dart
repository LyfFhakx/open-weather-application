part of 'weather_bloc.dart';

base class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object?> get props => [];
}

final class WeatherInitial extends WeatherState {
  const WeatherInitial();
}

final class WeatherLoading extends WeatherState {
  const WeatherLoading();
}


final class WeatherSuccess extends WeatherState {
  final WeatherResponse weather;

  const WeatherSuccess({required this.weather});

  @override
  List<Object> get props => [weather];
}

final class WeatherError extends WeatherState {
  final String errorMessage;

  const WeatherError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}

final class WeatherLocationError extends WeatherState {
  final String errorMessage;

  const WeatherLocationError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
