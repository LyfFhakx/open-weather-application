import 'package:either_dart/either.dart';
import 'package:open_weather_application/src/data.dart';

Either<String,Weather> getCurrentWeather(List<Weather> weatherReport){
  DateTime currentDateTime =DateTime.now();
  for(int i=0;i<weatherReport.length;i++){
    int hour = weatherReport[i].dtTxt.hour;
    int currentHour = currentDateTime.hour;
    if(weatherReport[i].dtTxt.day==currentDateTime.day){
      if(hour==currentHour){
        return Right(weatherReport[i]);
      }
      if(hour<currentHour&&currentHour-hour<1){
        return Right(weatherReport[i]);
      }else if(
      hour>currentHour&&hour-hour<1
      ){
        return Right(weatherReport[i]);
      }
    }
  }
  return Left("no Value");
}