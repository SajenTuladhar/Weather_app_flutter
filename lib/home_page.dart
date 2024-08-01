// ignore_for_file: file_names

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:weather_app/Additional%20_info.dart';
import 'package:weather_app/card.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomePageState();
}

class _HomePageState extends State<Home> {
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
      body: Padding(
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
                    child: const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Text(
                            '300F',
                            style: TextStyle(
                                fontSize: 32, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Icon(
                            Icons.cloud,
                            size: 70,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text('Rain',
                              style: TextStyle(
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
              'Weather Forecast',
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
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                AdditionalInfo(
                  icon: Icons.water_drop_outlined,
                  data: 'Humidity',
                  value: '91',
                ),
                AdditionalInfo(
                   icon: Icons.air,
                  data: 'Wind Speed',
                  value: '7.5',
                ),
                AdditionalInfo(
                   icon: Icons.keyboard_double_arrow_down, 
                  data: 'pressure',
                  value: '1000',
                ),
             
              ],
            )
          ],
        ),
      ),
    );
  }
}

