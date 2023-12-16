import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String errorMessage;

  const Failure(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}

/// General failures
class ServerFailure extends Failure {
  final int? statusCode;

  const ServerFailure(String errorMessage, this.statusCode)
      : super(
          errorMessage,
        );
}

/// General failures
class LocationServiceFailure extends Failure {
  const LocationServiceFailure(String errorMessage) : super(errorMessage);
}
class LocationPermissionFailure extends Failure {
  const LocationPermissionFailure(String errorMessage) : super(errorMessage);
}

