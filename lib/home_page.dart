// ignore_for_file: file_names

import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:weather_app/additional_info.dart';

import 'package:weather_app/card.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/secrete.dart';


class Home extends StatefulWidget {
  const Home({super.key});
  
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  Future<Map<String, dynamic>> getCurrentWeather() async{
    try{
    // Define the city for which to get the weather
   String city = 'Nepal';

    // Send a GET request to the OpenWeatherMap API
     final result = await http.get( // await waits for http to get the requested data then goes to another line
      Uri.parse( // converts url into uri object 
        'https://api.openweathermap.org/data/2.5/forecast?q=$city,Kathmandu&APPID=$openWeatherApiKEY',
        ));

    final data = jsonDecode(result.body);

    if (data['cod']!= '200'){
      throw 'An unexpected error occured';
    }
     return data; 
       
    }
    catch(e){
      throw e.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather App",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed:
                  () {}, //icon button provides with its own padding whereas in gesture detector and inkwell they dont
              icon: const Icon(Icons.refresh))
        ],
      ),
      body: FutureBuilder(
        future: getCurrentWeather(),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return const Center(child: CircularProgressIndicator.adaptive());
          }

          if (snapshot.hasError){
            return  Center(
              child: Text(snapshot.error.toString()));
          }

          final data = snapshot.data!;

          final currentWeatherData= data['list'][0]; // this is the top of the list of data so it repeats alot of time
          final currentWeatherTemp=  currentWeatherData['main']['temp'];
          final currentSky = currentWeatherData['weather'][0]['main'];
          final currentPressure = currentWeatherData['main']['pressure'];
          final currentHumidity = currentWeatherData['main']['humidity'];
          final currentWindSpeed = currentWeatherData['wind']['speed'];

          return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //main card
              SizedBox(
                  width: double.infinity,
                  child: Card(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(18))),
                    elevation: 10,
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                          sigmaX: 0.5, sigmaY: 0.5), //applies gaussian blur
                      child:  Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Text(
                              "$currentWeatherTemp  k",
                              style: const TextStyle(
                                  fontSize: 32, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 10,
                            ),

                             Icon(
                              currentSky=='Clouds' || currentSky=='Rain'? Icons.cloud: Icons.sunny,
                              size: 70,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                             Text(currentSky,
                                style: const TextStyle(
                                  fontSize: 20,
                                ))
                          ],
                        ),
                      ),
                    ),
                  )),
        
              const SizedBox(
                height: 30,
              ),
              const Text(
                'Hourly Forecast',
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 15,
              ),
              const SingleChildScrollView( 
                scrollDirection: Axis.horizontal,
                child:  Row(
                  children: [
                    //forecast cards
                    HourlyForecast(
                      time: '11:15',icon: Icons.cloud,temperature: '340',),
                    HourlyForecast(
                      time: '1:00',icon: Icons.beach_access,temperature: '130',
                    ),
                    HourlyForecast(
                      time: '3:20',icon: Icons.sunny,temperature: '450',
                    ),
                    HourlyForecast(
                      time: '4:50',icon: Icons.sunny,temperature: '460',
                    ),
                    HourlyForecast(
                      time: '6:15',icon: Icons.cloudy_snowing,temperature: '90',
                    ),
                    HourlyForecast(
                      time: '7:05',icon: Icons.sunny,temperature: '440',
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              //additonal info
              const Text(
                'Additional Information',
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 18,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  AdditionalInfo(
                    icon: Icons.water_drop_outlined,
                    data: 'Humidity',
                    value: currentHumidity.toString(),
                  ),
                  AdditionalInfo(
                     icon: Icons.air,
                    data: 'Wind Speed',
                    value: currentWindSpeed.toString(),
                  ),
                  AdditionalInfo(
                     icon: Icons.keyboard_double_arrow_down, 
                    data: 'pressure',
                    value: currentPressure.toString(),
                  ),
               
                ],
              )
            ],
          ),
        );
        }
      ),
    );
  }
}

