import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:open_weather_application/src/common/theme/app_colors.dart';
import 'package:open_weather_application/src/common/theme/font_theme.dart';
import 'package:open_weather_application/src/core/locators/service_locator.dart';

import '../../../core.dart';
import '../../../utils/utils.dart';
import '../../widget/weather_report_card.dart';
import '../../widget/weather_temperature_container.dart';
import 'bloc/weather_bloc.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  late final WeatherBloc _weatherBloc;

  @override
  void initState() {
    _weatherBloc =
        WeatherBloc(weatherRepository: getIt(), locationRepository: getIt())
          ..add(const GetLocationEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
            const Color(0xff0700FF).withOpacity(0.4392),
            const Color(0xff000000)
          ])),
      child: Stack(
        children: [
          BlocBuilder<WeatherBloc, WeatherState>(
            bloc: _weatherBloc,
            builder: (context, state) {
              if (state is! WeatherLoading) {
                return Positioned(
                  left: 30.w,
                  right: 30.w,
                  child: Image.asset(Helper.getImagePath('ellipse.png'),
                      fit: BoxFit.cover),
                );
              } else {
                return const SizedBox();
              }
            },
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              leadingWidth: 0,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                      width: 24.w,
                      height: 24.h,
                      child: SvgPicture.asset(Helper.getSvgPath("pin.svg"))),
                  SizedBox(
                    width: 8.w,
                  ),
                  BlocBuilder<WeatherBloc, WeatherState>(
                    bloc: _weatherBloc,
                    builder: (context, state) {
                      if (state is WeatherSuccess) {
                        return Text(
                          "${state.weather.city.name}, ${state.weather.city.country?.contains("RU")??false ? "Россия" : state.weather.city.country}",
                          style: FontTheme.b2Medium.style(),
                        );
                      }
                      if (state is WeatherError) {
                        return Text(
                          state.errorMessage,
                          style:
                              FontTheme.b2Medium.style(color: AppColors.error),
                        );
                      }
                      if (state is WeatherError) {
                        return Text(
                          state.errorMessage,
                          style:
                              FontTheme.b2Medium.style(color: AppColors.error),
                        );
                      }
                      if (state is WeatherLoading) {
                        return Container();
                      } else {
                        return const SizedBox();
                      }
                    },
                  ),
                ],
              ),
            ),
            body: BlocBuilder<WeatherBloc, WeatherState>(
                bloc: _weatherBloc,
                builder: (context, state) {
                  if (state is WeatherLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state is WeatherSuccess) {
                    return SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 180.h,
                            height: 180.h,
                            child: Image.asset(
                              Helper.getImagePath(getBigWeatherImage(
                                  getCurrentWeather(state.weather.weatherReport)
                                      .right
                                      .weather!
                                      .first
                                      .main??"")),
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(
                            height: 128.h,
                            child: WeatherTemperatureContainer(
                                weather: getCurrentWeather(
                                    state.weather.weatherReport)),
                          ),
                          SizedBox(
                            height: Helper.getHorizontalSpace(),
                          ),
                          WeatherReportCard(
                            weatherReport: state.weather.weatherReport,
                          ),
                          SizedBox(
                            height: Helper.getHorizontalSpace(),
                          ),
                        ],
                      ),
                    );
                  }
                  if (state is WeatherError ){
                    return Center(child: Text(state.errorMessage),);
                  }
                  if (state is WeatherLocationError){
                    return Center(child: Text(state.errorMessage,style: FontTheme.b2Medium.style(color: AppColors.error),),);
                  }
                  else {
                    return const SizedBox();
                  }
                }),
          ),
        ],
      ),
    );
  }
}
