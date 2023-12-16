
import 'package:open_weather_application/src/core/locators/service_locator.dart';

import '../../data.dart';

Future<void> initializeFireBaseInjections() async{
  getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService());

}