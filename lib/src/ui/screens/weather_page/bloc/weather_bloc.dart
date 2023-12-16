import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_weather_application/src/data/models/models.dart';

import '../../../../domain.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository _weatherRepository;
  final LocationRepository _locationRepository;

  WeatherBloc(
      {required WeatherRepository weatherRepository,
      required LocationRepository locationRepository})
      : _weatherRepository = weatherRepository,
        _locationRepository = locationRepository,
        super(const WeatherInitial()) {
    on<GetWeatherEvent>(_onGetWeatherEvent);
    on<GetLocationEvent>(_onGetLocationEvent);
  }

  _onGetWeatherEvent(GetWeatherEvent event, Emitter<WeatherState> emit) async {
    final result = await _weatherRepository.getWeather(event.lat,event.lon);
    result.fold((left) {
      emit(WeatherError(left.errorMessage));
    }, (right) {
      emit(WeatherSuccess(weather: right));
    });
  }

  _onGetLocationEvent(
      GetLocationEvent event, Emitter<WeatherState> emit) async {
    emit(const WeatherLoading());
    final result = await _locationRepository.determinePosition();
    result.fold((left) {
      emit(WeatherLocationError(left.errorMessage));
    }, (right) {
      add(GetWeatherEvent(right.latitude, right.longitude));
    });
  }
}
