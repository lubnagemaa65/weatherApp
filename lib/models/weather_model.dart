import 'package:flutter/material.dart';

class WeatherModel {

   // ignore: non_constant_identifier_names
   String weather_state_name;
  DateTime date;
   double min_temp;
   // ignore: non_constant_identifier_names
   double max_temp;
   // ignore: non_constant_identifier_names
   double the_temp;
  
  WeatherModel({
    // ignore: non_constant_identifier_names
    required this.weather_state_name,
    required this.date,
    required this.min_temp,
    required this.max_temp,
    required this.the_temp,
  });
  
factory WeatherModel.fromJson(Map<String, dynamic>data){
  return WeatherModel(

weather_state_name : data['weather_state_name'],
 date: DateTime.parse( data['created']),
 min_temp: data ['min_temp'],
      max_temp: data['max_temp'],
       the_temp: data ['the_temp'],);
}
String getImage(){
  if(weather_state_name=='Thunderstorm'||weather_state_name=='Thunder'|| weather_state_name=='Light Cloud'){
return 'assets/images/thunderstorm.png';
  }
  else if (weather_state_name=='clear'){
    return 'assets/images/clear.png';
  }
   else if (weather_state_name=='Snow'||weather_state_name=='Hail'||weather_state_name=='Sleet'){
    return 'assets/images/snow.png';

  }
   else if (weather_state_name=='Heavy Cloud'){
    return 'assets/images/cloudy.png';
  }
   else if (weather_state_name=='Light Rain'||weather_state_name=='Heavy Rain'||weather_state_name=='Showers'){
    return 'assets/images/rainy.png';
  }
else{return 'assets/images/clear.png';}
}
MaterialColor? getThemeColor(){
  if(weather_state_name=='Thunderstorm'||weather_state_name=='Thunder'|| weather_state_name=='Light Cloud'){
return Colors.blueGrey;
  }
  else if (weather_state_name=='clear'){
    return Colors.orange;
  }
   else if (weather_state_name=='Snow'||weather_state_name=='Hail'||weather_state_name=='Sleet'){
    return Colors.blue;

  }
   else if (weather_state_name=='Heavy Cloud'){
    return Colors.blue;
  }
   else if (weather_state_name=='Light Rain'||weather_state_name=='Heavy Rain'||weather_state_name=='Showers'){
    return Colors.blue;
  }

}


}
