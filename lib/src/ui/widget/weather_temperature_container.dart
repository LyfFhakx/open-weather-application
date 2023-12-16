import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_weather_application/src/data.dart';

import '../../common.dart';
import '../../common/theme/font_theme.dart';

class WeatherTemperatureContainer extends StatelessWidget {
  final Either<String,Weather> weather;

  const WeatherTemperatureContainer({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    if(weather.isRight) {
      return  Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "${weather.right.main.temp.celsius?.toStringAsFixed(0)}º",
              style: FontTheme.uMedium.style(color: AppColors.white),
            ),

            Text(
              weather.right.weather.first.main,
              style: FontTheme.b1.style(color: AppColors.white),
            ),
            Text(
              "Макс:${weather.right.main.tempMax.celsius?.toStringAsFixed(1)}º Мин:${weather.right.main.tempMin.celsius?.toStringAsFixed(1)}º",
              style: FontTheme.b1.style(color: AppColors.white),
            ),
          ],

      );
    }
    else{
      return Center(child: Text(weather.left),);
    }
  }
}
