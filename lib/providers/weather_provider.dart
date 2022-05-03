import 'package:flutter/cupertino.dart';
import 'package:weather/models/weather_model.dart';

class WeatherProvider extends ChangeNotifier{
  WeatherModel? _weatherData;
  set weatherData(WeatherModel? weather){
    _weatherData=weather;
    notifyListeners();
  
  }
  WeatherModel  get weatherData => weatherData;
}