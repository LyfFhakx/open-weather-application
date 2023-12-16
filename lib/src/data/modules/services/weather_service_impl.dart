import 'package:dio/dio.dart';
import '../../../core/error/dio_exception_handler.dart';
import '../../../core/error/exceptions.dart';
import '../../../data.dart';

class WeatherServiceImpl extends WeatherService {
  final Dio dio;

  WeatherServiceImpl(this.dio);

  @override
  Future<WeatherResponse> getWeather(double lat,double lon) async {
    try {
      final result = (await dio.get("${setLocationPath(lat, lon)}${setApiKey()}&lang=ru"));
      if (result.data == null) {
        throw ServerException("Unknown Error", result.statusCode);
      }
      return WeatherResponse.fromJson(result.data);
    } on DioException catch (e) {
      throw ServerException(handleDioException(e), e.response?.statusCode);
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException(e.toString(), null);
    }
  }
}
