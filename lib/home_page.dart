// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
      body: const Padding(
        padding:  EdgeInsets.all(16.0),
        child:  Column(
          children: [
            //main card
            SizedBox(
                width: double.infinity,
                child: Card(
                  elevation: 10,
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Text(
                          '300F',
                          style:
                              TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                        ),
                         SizedBox(height: 10,),
                        Icon(Icons.cloud,size: 70,),
                          SizedBox(height: 20,),
                        Text('Rain',style:
                              TextStyle(fontSize: 20, ))
                      ],
                    ),
                  ),
                )),
        
            SizedBox(
              height: 30,
            ),
            //forecast cards
            Placeholder(
              fallbackHeight: 150,
            ),
            SizedBox(
              height: 30,
            ),
            //additonal info
            Placeholder(
              fallbackHeight: 150,
            ),
          ],
        ),
      ),
    );
  }
}
