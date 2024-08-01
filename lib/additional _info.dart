import 'package:flutter/material.dart';

class AdditionalInfo extends StatelessWidget {
  final IconData icon;
  final String data;
  final String value ;
  const AdditionalInfo({
    super.key,
    required this.icon,
    required this.data,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
      return  Column(
        children: [
          Icon( icon ,size: 40,),
          const SizedBox(height: 12,),
          Text(data ,style: const TextStyle(fontSize: 20),),
          const SizedBox(height: 12,),
          Text(value ,style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)
        ],
      );
  }
}

