import 'package:either_dart/either.dart';
import 'package:geolocator/geolocator.dart';
import 'package:open_weather_application/src/domain.dart';
import 'package:open_weather_application/src/domain/failure/failure.dart';

typedef PositionResponse = Either<Failure, Position>;

class LocationRepositoryImpl extends LocationRepository {
  @override
  Future<Either<Failure, Position>> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return const Left(
          LocationServiceFailure('Location services are disabled.'));
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return const Left(
            LocationPermissionFailure('Location permissions are denied'));
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return const Left(LocationPermissionFailure(
          'Location permissions are permanently denied, we cannot request permissions.'));
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return Right(await Geolocator.getCurrentPosition());
  }
}
