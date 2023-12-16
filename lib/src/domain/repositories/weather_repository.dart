import 'package:either_dart/either.dart';
import '../../data.dart';
import '../failure/failure.dart';

abstract class WeatherRepository {
  Future<Either<Failure, WeatherResponse>> getWeather(double lat,double lon);
}
