import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:open_weather_application/src/common/theme/font_theme.dart';
import 'package:open_weather_application/src/core.dart';

import '../../common/theme/app_colors.dart';
import '../../data.dart';
import '../../utils/utils.dart';

class HourlyWeatherContainer extends StatelessWidget {
  final Weather weather;
  final bool isTapped;

  const HourlyWeatherContainer({super.key, required this.weather, required this.isTapped});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: isTapped?BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.white.withOpacity(0.4),
        border: Border.all(width: 1,color: AppColors.white)
      ):null,
      child: Column(
        children: [
          Text(DateFormat("Hm").format(weather.dtTxt??DateTime.now()),style: FontTheme.b2.style(),),
          SizedBox(height: 12.h,),
          SizedBox(
              height: 32,width: 32,
              child: SvgPicture.asset(Helper.getSvgPath(getSmallWeatherImage(weather.weather?.first.main??"")))),
          SizedBox(height: 12.h,),
          Text("${weather.main?.temp?.celsius?.toStringAsFixed(0)??0}º",style: FontTheme.b1.style(),)
        ],
      ),
    );
  }
}
