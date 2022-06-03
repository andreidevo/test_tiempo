import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WeatherAvatar extends StatelessWidget {

  double radius;
  String assetPicture;
  Color backgroundColor;

  WeatherAvatar({Key? key,
    required this.radius,
    required this.assetPicture,
    required this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: radius * 2 + 10,
      height: radius * 2 + 10,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: backgroundColor
      ),
      child: Center(
        child: ClipOval(
          child: SizedBox.fromSize(
            size: Size.fromRadius(radius), // Image radius
            child: SvgPicture.asset(
              assetPicture
            )
          ),
        ),
      ),
    );
  }
}