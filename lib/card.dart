import 'package:flutter/material.dart';

//weather forecast card widget
class HourlyForecast extends StatelessWidget {
  const HourlyForecast({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(width: 119, 
                child: Card(
                  elevation: 8,
                  child: Padding(
                    padding: EdgeInsets.all(14.0),
                    child: Column(
                      children: [
                        Text('11:15',style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        SizedBox(height: 8,),
                        Icon(Icons.cloud,size: 40,),
                        SizedBox(height: 8,),
                        Text('320',style: TextStyle(fontSize: 16,),),
                      ],
                    ),
                  ),
                )
                ); 
  }
}
