import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data.dart';
import '../../../../utils/logs/log.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final FirebaseAuthService _authService;

  AuthBloc(FirebaseAuthService authService)
      : _authService = authService,
        super(const AuthInitial()) {
    on<AuthUserEvent>(_onAuthUserEvent);
  }

  _onAuthUserEvent(AuthUserEvent event, Emitter<AuthState> emit) async {
    emit(const AuthLoading());
    final result = await _authService.signINWithEmailAndPassword(event.email, event.password);
    result.fold((left) {
      Log.error(left.$1.toString(),left.$1,left.$2);
        emit(AuthError(left.$1.toString()));

    }, (right) {
      emit(const AuthSuccess());
    });
  }
}
