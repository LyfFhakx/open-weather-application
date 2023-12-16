import '../../data.dart';
import '../../domain.dart';
import '../network/dio_network.dart';
import 'service_locator.dart';

initWeatherInjections(){
  getIt.registerSingleton<WeatherService>(WeatherServiceImpl(DioNetwork.appAPI));
  getIt.registerSingleton<WeatherRepository>(WeatherRepositoryImpl(getIt()));
}