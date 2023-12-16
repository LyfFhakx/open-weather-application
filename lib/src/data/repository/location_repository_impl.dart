import 'package:either_dart/either.dart';
import 'package:geolocator/geolocator.dart';
import 'package:open_weather_application/src/domain.dart';

typedef PositionResponse = Either<Failure, Position>;

class LocationRepositoryImpl extends LocationRepository {
  @override
  Future<Either<Failure, Position>> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return const Left(
          LocationServiceFailure('Location services are disabled.'));
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return const Left(
            LocationPermissionFailure('Location permissions are denied'),);
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return const Left(LocationPermissionFailure(
          'Location permissions are permanently denied, we cannot request permissions.'));
    }

    return Right(await Geolocator.getCurrentPosition());
  }
}
