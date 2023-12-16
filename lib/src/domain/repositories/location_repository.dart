import 'package:either_dart/either.dart';
import 'package:geolocator/geolocator.dart';

import '../failure/failure.dart';

abstract class LocationRepository{
  Future<Either<Failure,Position>> determinePosition();
}