import '../../data.dart';
import '../../domain.dart';
import 'service_locator.dart';

initLocationInjections(){
  getIt.registerSingleton<LocationRepository>(LocationRepositoryImpl());
}