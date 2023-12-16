import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:open_weather_application/src/common.dart';
import 'package:open_weather_application/src/ui/screens/splash_page/splash_page.dart';
import 'package:open_weather_application/src/utils/logs/app_bloc_observer.dart';
import 'package:open_weather_application/src/utils/logs/app_logger.dart';
import 'firebase_options.dart';
import 'src/core/locators/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await serviceLocatorInitialization();
  AppLogger.loggingError();
  Bloc.observer = AppBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  Locale locale = const Locale("ru");

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting("ru_RU");
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            locale: locale,
            title: 'Open weather app',
            theme: appTheme,
            home: const SplashPage(),
          );
        });
  }
}
