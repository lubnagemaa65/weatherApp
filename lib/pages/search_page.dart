import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:weather/models/weather_model.dart';
import 'package:weather/providers/weather_provider.dart';
import 'package:weather/services/weather_service.dart';

class SearchPage extends StatelessWidget {
  String? cityName;
   SearchPage( {
    Key? key,
    this.cityName,
    this.updateUI,
  }) : super(key: key);

  VoidCallback?updateUI;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('Search a City')
      ),
      body: Center(
        child:Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: TextField(
          onChanged: (data) {
            cityName=data;
            
          },
          onSubmitted: (data)async{
          cityName=data ;

        WeatherService service = WeatherService();
         WeatherModel? weather= await service.getWeather(cityName: cityName!);

        Provider.of<WeatherProvider>(context,listen: false).weatherData = weather;
         Navigator.pop(context);

          },
          
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical:32,horizontal: 24),
            labelText:('Search'),
            suffixIcon: GestureDetector
          (
            onTap: ()async {
             

        WeatherService service = WeatherService();
         WeatherModel ?weather= await service.getWeather(cityName: cityName!);

        Provider.of<WeatherProvider>(context,listen: false).weatherData = weather;
         Navigator.pop(context);

            },
            child: Icon(Icons.search)),
            border: OutlineInputBorder() ,
            hintText: 'Enter A City',
          ),
        ),
      ),
    ));
  }
}
