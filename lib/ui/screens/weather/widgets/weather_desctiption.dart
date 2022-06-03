import 'package:flutter/material.dart';
import 'package:test_tiempo/Utils/utils.dart';

class WeatherDescription extends StatelessWidget {

  String title;
  int temperatureMax;
  int temperatureMin;

  WeatherDescription({Key? key,
    required this.title,
    required this.temperatureMax,
    required this.temperatureMin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 15,),
        Text(Utils().getTemperature(
          max: temperatureMax,
          min: temperatureMin,
        ),
          style: const TextStyle(
            fontSize: 27,
            fontWeight: FontWeight.w700
          ),
        ),
        const SizedBox(height: 2,),
        Text(
          title,
          style: const TextStyle(
            fontSize: 15,
            color: Color(0xFF999999)
          ),
        ),
        const SizedBox(height: 15,),
      ],
    );
  }
}