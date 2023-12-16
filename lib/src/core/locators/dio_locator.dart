import '../../utils/logs/app_logger.dart';
import '../network/dio_network.dart';

Future<void> initializeDioInjections() async{
  await Future.delayed(const Duration(milliseconds: 300));
  initRootLogger();
  DioNetwork.initDio();
}