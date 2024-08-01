import 'package:flutter/material.dart';

//weather forecast card widget
class HourlyForecast extends StatelessWidget {
  final String time;
  final IconData icon ;
  final String temperature ; 
  const HourlyForecast({
    super.key,
    required this.time,
    required this.icon,
    required this.temperature,
  });

  @override
  Widget build(BuildContext context) {
    return  SizedBox(width: 119, 
                child: Card(
                  elevation: 8,
                  child: Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Column(
                      children: [
                        Text( time ,style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                       const  SizedBox(height: 8,),
                        Icon(icon,size: 40,),
                        const SizedBox(height: 8,),
                        Text(temperature,style: const TextStyle(fontSize: 16,),),
                      ],
                    ),
                  ),
                )
                ); 
  }
}
