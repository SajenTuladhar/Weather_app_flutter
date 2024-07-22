// ignore_for_file: file_names

import 'dart:ui';
import 'package:flutter/material.dart';


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
              height: 20,
            ),
            const Row(
              children: [
              SizedBox(width: 119, 
              child: Card(
                elevation: 8,
                child: Padding(
                  padding: EdgeInsets.all(14.0),
                  child: Column(
                    children: [
                      Text('3:00',style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      SizedBox(height: 8,),
                      Icon(Icons.cloud,size: 40,),
                      SizedBox(height: 8,),
                      Text('320',style: TextStyle(fontSize: 16,),),
                    ],
                  ),
                ),
              )),
              ],
            ),
             
            
            const SizedBox(height: 20,),
            //forecast cards
            const Placeholder(
              fallbackHeight: 150,
            ),
            const SizedBox(
              height: 30,
            ),
            //additonal info
            const Placeholder(
              fallbackHeight: 70,
            ),
          ],
        ),
      ),
    );
  }
}
