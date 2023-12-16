import 'package:get_it/get_it.dart';
import 'package:open_weather_application/src/core/locators/weather_locator.dart';

import 'dio_locator.dart';
import 'location_locator.dart';

final getIt = GetIt.instance;

Future<void> serviceLocatorInitialization() async {
  // await getIt.reset();
  await initializeDioInjections();
  await initWeatherInjections();
  await initLocationInjections();
  // await getIt.allReady();
}
