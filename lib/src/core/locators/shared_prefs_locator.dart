import 'package:open_weather_application/src/core/locators/service_locator.dart';
import 'package:shared_preferences/shared_preferences.dart';

initSharedPrefsInjections() async {
  getIt.registerSingletonAsync<SharedPreferences>(() async {
    return await SharedPreferences.getInstance();
  });
  await getIt.isReady<SharedPreferences>();
}