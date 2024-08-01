import 'package:flutter/material.dart';

class AdditionalInfo extends StatelessWidget {
  const AdditionalInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
      return const Column(
        children: [
          Icon( Icons.water_drop,size: 36,),
          SizedBox(height: 8,),
          Text('Humidity',style: TextStyle(fontSize: 20),),
          SizedBox(height: 8,),
          Text('94',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)
        ],
      );
  }
}

