import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:open_weather_application/src/common.dart';
import 'package:open_weather_application/src/common/theme/font_theme.dart';

import '../../core.dart';
import '../../data.dart';
import '../../utils/utils.dart';

class WeatherReportDetailsContainer extends StatelessWidget {
  final Wind? wind;
  final int humidity;

  const WeatherReportDetailsContainer(
      {super.key, required this.wind, required this.humidity});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Helper.getHorizontalSpace()),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: ColoredBox(
          color: Colors.white.withOpacity(0.20),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            child: Column(
              children: [
                infoRow('wind.svg', "${wind?.speed.toStringAsFixed(1)}м/с",
                    "Ветер ${windDegToText(wind?.deg??0)}"),
                SizedBox(
                  height: 16.h,
                ),
                infoRow('drop.svg', "$humidity%", "Высокая влажность"),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget infoRow(String svgPath, String data, String description) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 2,
          child: Row(
            children: [
              SvgPicture.asset(Helper.getSvgPath(svgPath)),
              SizedBox(
                width: 8.w,
              ),
              Text(
                data,
                style: FontTheme.b2Medium
                    .style(color: AppColors.white.withOpacity(0.2)),
              ),
            ],
          ),
        ), //svg
        Expanded(
          flex: 3,
          child: Text(
            description,
            textAlign: TextAlign.start,
            style: FontTheme.b2.style(),
          ),
        ),
      ],
    );
  }
}
