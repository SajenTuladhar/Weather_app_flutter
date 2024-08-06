// ignore_for_file: file_names

import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
  Future<Map<String, dynamic>> getCurrentWeather() async {
    try {
      // Define the city for which to get the weather
      String city = 'Nepal';

      // Send a GET request to the OpenWeatherMap API
      final result = await http.get(
        Uri.parse(
          'https://api.openweathermap.org/data/2.5/forecast?q=$city,Kathmandu&APPID=$openWeatherApiKEY',
        ),
      );

      final data = jsonDecode(result.body);

      if (data['cod'] != '200') {
        throw 'An unexpected error occurred';
      }
      return data;
    } catch (e) {
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
              onPressed: () {
                setState(() {
                });
              },
              icon: const Icon(Icons.refresh))
        ],
      ),
      body: FutureBuilder(
          future: getCurrentWeather(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator.adaptive());
            }

            if (snapshot.hasError) {
              return Center(child: Text(snapshot.error.toString()));
            }

            final data = snapshot.data!;

            final currentWeatherData = data['list'][0];
            final currentWeatherTemp = currentWeatherData['main']['temp'];
            final currentSky = currentWeatherData['weather'][0]['main'];
            final currentPressure = currentWeatherData['main']['pressure'];
            final currentHumidity = currentWeatherData['main']['humidity'];
            final currentWindSpeed = currentWeatherData['wind']['speed'];

            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Main card
                  SizedBox(
                      width: double.infinity,
                      child: Card(
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(18))),
                        elevation: 10,
                        child: BackdropFilter(
                          filter: ImageFilter.blur(
                              sigmaX: 0.5, sigmaY: 0.5),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              children: [
                                Text(
                                  "$currentWeatherTemp K",
                                  style: const TextStyle(
                                      fontSize: 32, fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 10),
                                Icon(
                                  currentSky == 'Clouds' || currentSky == 'Rain'
                                      ? Icons.cloud
                                      : Icons.sunny,
                                  size: 70,
                                ),
                                const SizedBox(height: 20),
                                Text(currentSky,
                                    style: const TextStyle(fontSize: 20))
                              ],
                            ),
                          ),
                        ),
                      )),

                  const SizedBox(height: 30),
                  const Text(
                    'Hourly Forecast',
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 15),

                  SizedBox(
                    height: 120,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          final hourlyForecast = data['list'][index + 1];
                          final hourlySky = hourlyForecast['weather'][0]['main'] ?? 'Clear';
                          final hourlyTemp = hourlyForecast['main']['temp']?.toString() ?? 'N/A';
                          final timeString = hourlyForecast['dt_txt'] ?? '';
                          
                          if (timeString.isEmpty) {
                            return const SizedBox.shrink();
                          }

                          final time = DateTime.parse(timeString);

                          return HourlyForecast(
                            time: DateFormat('Hm').format(time),
                            temperature: hourlyTemp,
                            icon: hourlySky == 'Clouds' || hourlySky == 'Rain'
                                ? Icons.cloud
                                : Icons.sunny,
                          );
                        }),
                  ),

                  const SizedBox(height: 30),
                  // Additional info
                  const Text(
                    'Additional Information',
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 18),
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
                        data: 'Pressure',
                        value: currentPressure.toString(),
                      ),
                    ],
                  )
                ],
              ),
            );
          }),
    );
  }
}
