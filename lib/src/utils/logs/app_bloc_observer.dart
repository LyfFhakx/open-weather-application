import 'package:flutter_bloc/flutter_bloc.dart';

import 'log.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    Log.error({
      'bloc': bloc.toString(),
      'error': error.toString(),
      'stackTrack': stackTrace
    });
    super.onError(bloc, error, stackTrace);
  }
}