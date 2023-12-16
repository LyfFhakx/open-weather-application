import 'package:either_dart/either.dart';
import '../../core/error/exceptions.dart';
import '../../data.dart';
import '../../domain.dart';
import '../../domain/failure/failure.dart';

class WeatherRepositoryImpl extends WeatherRepository {
  final WeatherService weatherService;

  WeatherRepositoryImpl(this.weatherService);

  @override
  Future<Either<Failure,WeatherResponse>> getWeather(double lat,double lon) async {
    try {
      final result = await weatherService.getWeather(lat,lon);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    }
  }
}