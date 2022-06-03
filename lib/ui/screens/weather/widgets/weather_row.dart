import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_tiempo/Utils/utils.dart';

class WeatherRow extends StatelessWidget {

  bool active;
  String assetPicture;
  DateTime? dateTime;
  int temperatureMax;
  int temperatureMin;
  VoidCallback onTap;

  WeatherRow({Key? key,
    required this.active,
    required this.assetPicture,
    required this.dateTime,
    required this.temperatureMax,
    required this.temperatureMin,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 64,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            border: Border.all(
              color: (active) ?
                const Color(0xFF562BF7) :
                const Color(0xFFECE7FF),
              width: 2
            ),
            color: const Color(0xFFECE7FF)
          ),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    Utils().getDayFromDateTime(
                      dateTime: dateTime,
                      context: context
                    ),
                    style: const TextStyle(
                      color: Color(0xFFA891FF)
                    ),
                  ),
                ),
              ),
              Center(
                child: Text(
                  Utils().getTemperature(
                    max: temperatureMax,
                    min: temperatureMin
                  ),
                  style: const TextStyle(
                    fontWeight: FontWeight.w700
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: SvgPicture.asset(
                  assetPicture,
                  height: 64, width: 64,
                ),
              ),

            ],
          )
        ),
      ),
    );
  }
}