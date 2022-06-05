import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

enum ButtonWidgetEnum { inactive, active, completed }

class ButtonWidget extends StatelessWidget {

  double width;
  double height;
  String content;
  VoidCallback onTap;
  ButtonWidgetEnum buttonState;

  ButtonWidget({Key? key,
    required this.width,
    required this.height,
    required this.content,
    required this.onTap,
    required this.buttonState
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          color: getColorButton()
        ),
        child: Center(
          child: Text(getText(context), style: TextStyle(
            fontSize: 14,
            color: getColorText()
          )
        ),
      ))
    );
  }

  Color getColorButton(){
    switch (buttonState){
      case ButtonWidgetEnum.inactive:
        return const Color(0xFFEDE9FF);
      case ButtonWidgetEnum.active:
        return const Color(0xFF562BF7);
      case ButtonWidgetEnum.completed:
        return const Color(0xFF2BF789);
    }
  }

  Color getColorText(){
    switch (buttonState){
      case ButtonWidgetEnum.inactive:
        return const Color(0xFFA891FF);
      case ButtonWidgetEnum.active:
        return const Color(0xFFFFFFFF);
      case ButtonWidgetEnum.completed:
        return const Color(0xFFFFFFFF);
    }
  }

  String getText(BuildContext context){
    if (buttonState == ButtonWidgetEnum.completed) {
      return AppLocalizations.of(context)!.exit;
    }

    return content;
  }
}
