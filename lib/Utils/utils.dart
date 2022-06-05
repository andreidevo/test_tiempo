import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

enum CitiesEnum { london, singapore, toronto}
enum LanguageEnum { en, es }

class Utils{
  
  List<double> getCoordinatesCity({required CitiesEnum city}){
    switch (city){
      case CitiesEnum.london:
        return [51.509865, -0.118092];
      case CitiesEnum.singapore:
        return [1.290270, 103.851959];
      case CitiesEnum.toronto:
        return [43.651070, -79.347015];
    }
  }

  String getCityByCitiesEnum({required CitiesEnum citiesEnum, required BuildContext context}){
    switch (citiesEnum){
      case CitiesEnum.london:
        return AppLocalizations.of(context)!.london;
      case CitiesEnum.singapore:
        return AppLocalizations.of(context)!.singapore;
      case CitiesEnum.toronto:
        return AppLocalizations.of(context)!.toronto;
    }
  }

  String getLocaleLanguage({required LanguageEnum languageEnum}){
    switch (languageEnum){
      case LanguageEnum.en:
        return 'en';
      case LanguageEnum.es:
        return 'es';
    }
  }

  String getDayFromDateTime({required DateTime? dateTime, required BuildContext context}){

    if (dateTime == null){
      return "";
    }

    int day = dateTime.day;

    switch (dateTime.month){
      case 1: return "$day ${AppLocalizations.of(context)!.january}";
      case 2: return "$day ${AppLocalizations.of(context)!.february}";
      case 3: return "$day ${AppLocalizations.of(context)!.march}";
      case 4: return "$day ${AppLocalizations.of(context)!.april}";
      case 5: return "$day ${AppLocalizations.of(context)!.may}";
      case 6: return "$day ${AppLocalizations.of(context)!.june}";
      case 7: return "$day ${AppLocalizations.of(context)!.july}";
      case 8: return "$day ${AppLocalizations.of(context)!.august}";
      case 9: return "$day ${AppLocalizations.of(context)!.september}";
      case 10: return "$day ${AppLocalizations.of(context)!.october}";
      case 11: return "$day ${AppLocalizations.of(context)!.november}";
      case 12: return "$day ${AppLocalizations.of(context)!.december}";
    }

    return "";
  }

  String getTemperature({required int max, required int min}){
    return "$max° / $min°";
  }

}