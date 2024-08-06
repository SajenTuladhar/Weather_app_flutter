import 'package:flutter/material.dart';

//weather forecast card widget
class HourlyForecast extends StatelessWidget {
  final String time;
  final IconData icon;
  final String temperature;
  const HourlyForecast({
    super.key,
    required this.time,
    required this.icon,
    required this.temperature,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 115,
        child: Card(
          
          elevation: 8,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(time,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(
                  height: 8,
                ),
                Icon(
                  icon,
                  size: 32,
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  temperature,
                ),
              ],
            ),
          ),
        ));
  }
}
