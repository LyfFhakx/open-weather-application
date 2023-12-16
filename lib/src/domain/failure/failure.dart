import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String errorMessage;
  final StackTrace? stackTrace;

  const Failure(this.errorMessage, [this.stackTrace]);

  @override
  List<Object> get props => [errorMessage];
}

/// General failures
class ServerFailure extends Failure {
  final int? statusCode;

  const ServerFailure(
    String errorMessage,
    StackTrace? stackTrace,
    this.statusCode,
  ) : super(errorMessage, stackTrace);
}

/// General failures
class LocationServiceFailure extends Failure {
  const LocationServiceFailure(String errorMessage,[StackTrace? stackTrace]) : super(errorMessage,stackTrace);
}

class LocationPermissionFailure extends Failure {
  const LocationPermissionFailure(String errorMessage,[StackTrace? stackTrace]) : super(errorMessage,stackTrace);}

