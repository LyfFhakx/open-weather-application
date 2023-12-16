import 'package:either_dart/either.dart';
import 'package:open_weather_application/src/data.dart';

Either<String, Weather> getCurrentWeather(List<Weather> weatherReport) {
  DateTime currentDateTime = DateTime.now();
  for (int i = 0; i < weatherReport.length; i++) {
    int hour = weatherReport[i].dtTxt?.hour??0;
    int currentHour = currentDateTime.hour;
    if (weatherReport[i].dtTxt?.day == currentDateTime.day) {
      if (hour == currentHour) {
        return Right(weatherReport[i]);
      }
      if (hour < currentHour && currentHour - hour < 1) {
        return Right(weatherReport[i]);
      } else if (hour > currentHour && hour - hour < 1) {
        return Right(weatherReport[i]);
      }
    }
  }
  return const Left("no Value");
}

String windDegToText(int degree) {
  if (degree > 337.5) return 'Северный';
  if (degree > 292.5) return 'Северо-западный';
  if (degree > 247.5) return 'Западный';
  if (degree > 202.5) return 'Юго-западный';
  if (degree > 157.5) return 'Южный';
  if (degree > 122.5) return 'Юго-восточный';
  if (degree > 67.5) return 'Восточный';
  if (degree > 22.5) {
    return 'Северо-восточный';
  }
  return 'Северный';
}

String getSmallWeatherImage(String weather) {
  if (weather.toLowerCase() == "clouds" ||
      weather.toLowerCase() == "few clouds" ||
      weather.toLowerCase() == "scattered clouds" ||
      weather.toLowerCase() == "broken") {
    return "small-cloud-sun.svg";
  }
  if (weather.toLowerCase() == "clear scy") {
    return "small-sun.svg";
  }
  if (weather.toLowerCase() == "rain" ||
      weather.toLowerCase() == "shower rain") {
    return "small-rain.svg";
  }
  if (weather.toLowerCase() == "snow") {
    return "small-snow.svg";
  }
  if (weather.toLowerCase() == "thunderstorm") {
    return "small-lightning.svg";
  } else {
    return "small-sun.svg";
  }
}

String getBigWeatherImage(String weather) {
  if (weather.toLowerCase() == "clouds" ||
      weather.toLowerCase() == "few clouds" ||
      weather.toLowerCase() == "scattered clouds" ||
      weather.toLowerCase() == "broken") {
    return "big-rain-sun.png";
  }
  if (weather.toLowerCase() == "clear scy") {
    return "big-sun.png";
  }
  if (weather.toLowerCase() == "rain" ||
      weather.toLowerCase() == "shower rain") {
    return "big-heavy-rain.png";
  }
  if (weather.toLowerCase() == "snow") {
    return "big-snow.png";
  }
  if (weather.toLowerCase() == "thunderstorm") {
    return "big-lightning.png";
  } else {
    return "big-sun.png";
  }
}
