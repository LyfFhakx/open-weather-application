import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:either_dart/either.dart';
import '../../core/error/exceptions.dart';
import '../../data.dart';
import '../../domain.dart';
import '../modules/services/cached_weather_service_impl.dart';

class WeatherRepositoryImpl extends WeatherRepository {
  final WeatherService weatherService;
  final CachedWeatherServiceImpl cachedWeatherServiceImpl;

  WeatherRepositoryImpl(this.weatherService, this.cachedWeatherServiceImpl);

  @override
  Future<Either<Failure, WeatherResponse>> getWeather(
      double lat, double lon) async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      try {
        final result = await cachedWeatherServiceImpl.getWeather();
        return Right(result);
      } catch (e) {
        return Left(ServerFailure(e.toString(), null, null));
      }
    } else {
      try {
        final result = await weatherService.getWeather(lat, lon);
        return Right(result);
      } on ServerException catch (e, stackTrace) {
        return Left(ServerFailure(e.message, stackTrace, e.statusCode));
      } catch (e) {
        return Left(ServerFailure(e.toString(), null, null));
      }
    }
  }
}
