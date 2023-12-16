part of 'auth_bloc.dart';

base class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {
  const AuthInitial();
}

final class AuthLoading extends AuthState {
  const AuthLoading();
}

final class AuthSuccess extends AuthState {
  const AuthSuccess();
}

final class AuthError extends AuthState {
  final String errorMessage;

  @override
  List<Object> get props => [errorMessage];

  const AuthError(this.errorMessage);
}
