import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:open_weather_application/src/core.dart';

import '../../common/theme/app_colors.dart';
import '../../data.dart';

class HourlyWeatherContainer extends StatelessWidget {
  final Weather weather;

  const HourlyWeatherContainer({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.white.withOpacity(0.4),
        border: Border.all(width: 1,color: AppColors.white)
      ),
      child: Column(
        children: [
          Text(DateFormat("Hm").format(weather.dtTxt)),
          SizedBox(height: 16.h,),
          SizedBox(
              height: 32,width: 32,
              child: SvgPicture.asset(Helper.getSvgPath("small-cloud-moon.svg"))),
          SizedBox(height: 16.h,),
          Text("${weather.main.temp.celsius?.toStringAsFixed(0)??0}º")
        ],
      ),
    );
  }
}
