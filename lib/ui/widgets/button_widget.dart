import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {

  double width;
  double height;
  String content;
  bool active;
  VoidCallback onTap;

  ButtonWidget({Key? key,
    required this.width,
    required this.height,
    required this.content,
    required this.active,
    required this.onTap
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          color: (active) ?
            const Color(0xFF562BF7) :
            const Color(0xFFEDE9FF),
        ),
        child: Center(
          child: Text(content, style: TextStyle(
            fontSize: 16,
            color: (active) ?
              const Color(0xFFFFFFFF) :
              const Color(0xFFA891FF),
            ),
          )
        ),
      ),
    );
  }
}
