import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather/models/weather_model.dart';

class WeatherService {
  String baseURL = 'https://www.metaweather.com';
  Future<int> getCityID({required String cityName}) async {
  
    Uri url = Uri.parse('$baseURL/api/location/search/?query=($cityName)');
    http.Response response = await http.get(url);

    List<dynamic> data = jsonDecode(response.body);
    int cityID = data[0]['woeid'];
    return cityID;
  }

  Future<WeatherModel?> getWeather({required String cityName}) async {
    WeatherModel? weatherData;
    try{
    int id = await getCityID(cityName: cityName);

    Uri url = Uri.parse('$baseURL/api/location/$id');
    http.Response response = await http.get(url);
    Map<String, dynamic> jsonData = jsonDecode(response.body);

    Map<String, dynamic> data = jsonData['consolidated_weather'][0];

    weatherData = WeatherModel.fromJson(data);
  }catch(e){

    print(e);
  }

   
    return weatherData;
  }
}
