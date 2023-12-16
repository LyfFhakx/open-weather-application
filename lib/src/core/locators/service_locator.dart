import 'package:get_it/get_it.dart';
import 'package:open_weather_application/src/core/locators/firabase_locator.dart';
import 'package:open_weather_application/src/core/locators/shared_prefs_locator.dart';
import 'package:open_weather_application/src/core/locators/weather_locator.dart';

import '../../data/modules/services/local_services/app_shared_prefs.dart';
import 'dio_locator.dart';
import 'location_locator.dart';

final getIt = GetIt.instance;

Future<void> serviceLocatorInitialization() async {
  await getIt.reset();
  await initSharedPrefsInjections();
  await initAppInjections();
  await initializeDioInjections();
  await initializeFireBaseInjections();
  await initWeatherInjections();
  await initLocationInjections();
  await getIt.allReady();
}


initAppInjections() {
  getIt.registerFactory<AppSharedPrefs>(() => AppSharedPrefs(getIt()));
}