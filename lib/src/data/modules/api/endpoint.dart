import '../../../utils.dart';

const String endpoint ="https://api.openweathermap.org/data/2.5/";

String setLocationPath(double lat,double lon){
  return "forecast?lat=$lat&lon=$lon";
}

String setApiKey(){
  return "&appid=$openWeatherApiKey";
}

