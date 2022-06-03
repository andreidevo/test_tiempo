import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_tiempo/Utils/utils.dart';
import 'package:test_tiempo/blocs/language/language_event.dart';

class LanguageBloc extends Bloc<LanguageEvent, Locale>{

  LanguageBloc() : super(const Locale('en', '')){
    on<LoadLanguageEvent>((event, emit) async {
      switch (event.language){
        case LanguageEnum.en:
          emit(const Locale('en', ''));
          break;
        case LanguageEnum.es:
          emit(const Locale('es', ''));
          break;
      }
    });
  }
}