import 'package:flutter/material.dart';
import 'package:test_tiempo/Utils/utils.dart';

class WeatherDescription extends StatelessWidget {

  String? title;
  double fontSize;
  int temperatureMax;
  int temperatureMin;

  WeatherDescription({Key? key,
    this.title,
    required this.fontSize,
    required this.temperatureMax,
    required this.temperatureMin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (title != null)
          const SizedBox(height: 15,),

        Text(Utils().getTemperature(
          max: temperatureMax,
          min: temperatureMin,
        ),
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.w700
          ),
        ),

        if (title != null)
          Column(
            children: [
              const SizedBox(height: 2,),
              Text(
                title!,
                style: const TextStyle(
                    fontSize: 15,
                    color: Color(0xFF999999)
                ),
              ),
              const SizedBox(height: 15,),
            ],
          )

      ],
    );
  }
}