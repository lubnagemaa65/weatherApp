import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/pages/search_page.dart';
import 'package:weather/providers/weather_provider.dart';

class HomePage extends StatefulWidget {
   HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> {
WeatherModel? weatherData;
  void updateUI(){
    
         setState((){
           
         });
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return SearchPage(
           updateUI:updateUI,

              );
            },));         },
           icon:Icon(Icons.search))
        ],
        title: Text('Weather App'),
      ),
      body: Provider.of<WeatherProvider>(context) != null ? Center(
         
        child: Container(

          child: Column(
            
            mainAxisSize: MainAxisSize.min,
            children: [
          
              Text(
                'there is no weather 😔 start',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              Text(
                'searching now 🔍',
                style: TextStyle(
                  fontSize: 30,
                ),
              )
            ],
          ),
        ),
      )
      :Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
            weatherData!.getThemeColor()![500]!,
            weatherData!.getThemeColor()![300]!,
            weatherData!.getThemeColor()![100]!,


          ],
          begin:Alignment.topCenter,end: Alignment.bottomCenter)
        ),

        child:Column(
          
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(flex: 3,),

            Text('cairo', style:TextStyle(fontSize:32,
            fontWeight: FontWeight.bold,
            ),
            
            ),
            Text(
              'updated at: ${weatherData!.date.hour.toString()}:${weatherData!.date.minute.toString()}',
               style: TextStyle(fontSize: 24,
            
            ),),
             Spacer(),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(weatherData!.getImage()),
               Text(weatherData!.the_temp.toInt().toString(), style:TextStyle(fontSize:30,
            fontWeight: FontWeight.bold,
            ),
            
            ),
              ],
            ),
            Column( 
              children:[
Text(weatherData!.max_temp.toInt().toString()),
Text(weatherData!.min_temp.toInt().toString()),
           Spacer(flex: 3,),

 Text(weatherData!.weather_state_name, style:TextStyle(fontSize:32,
            fontWeight: FontWeight.bold,
            ),
            
            ),
            ]

            ),
             Spacer(flex: 5,),

          ],
          
        )
      ),
    );
  }
}
