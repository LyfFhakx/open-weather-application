import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:open_weather_application/src/common/theme/font_theme.dart';
import 'package:open_weather_application/src/ui/widget/wether_report_details_container.dart';

import '../../common.dart';
import '../../core.dart';
import '../../data/models/models.dart';
import 'hourly_weather_container.dart';

class WeatherReportCard extends StatefulWidget {
  final List<Weather> weatherReport;

  const WeatherReportCard({super.key, required this.weatherReport});

  @override
  State<WeatherReportCard> createState() => _WeatherReportCardState();
}

class _WeatherReportCardState extends State<WeatherReportCard> {
  int _currentId = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 232.h,
          child: Padding(
            padding:
                EdgeInsets.symmetric(horizontal: Helper.getHorizontalSpace()),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: ColoredBox(
                color: Colors.white.withOpacity(0.20),
                child: Column(
                  children: [
                    SizedBox(
                      height: 16.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Сегодня",
                            style: FontTheme.b1Medium
                                .style(color: AppColors.white),
                          ),
                          Text(
                            DateFormat.d("ru_RU")
                                .add_LLLL()
                                .format(widget.weatherReport.first.dtTxt!),
                            style: FontTheme.b1Medium
                                .style(color: AppColors.white),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    Divider(
                      height: 1.h,
                      color: AppColors.white,
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: SizedBox(
                        height: 142.h,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            for (int i = 0; i < 4; i++)
                              GestureDetector(
                                onTap: () => setState(() {
                                  _currentId = i;
                                }),
                                child: HourlyWeatherContainer(
                                    isTapped: _currentId == i,
                                    weather: widget.weatherReport[i]),
                              )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: Helper.getHorizontalSpace(),
        ),
        SizedBox(
            height: 96,
            child: WeatherReportDetailsContainer(
              wind: widget.weatherReport[_currentId].wind,
              humidity: widget.weatherReport[_currentId].main?.humidity??0,
            )),
      ],
    );
  }
}
