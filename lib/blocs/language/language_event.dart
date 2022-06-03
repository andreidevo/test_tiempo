import 'package:equatable/equatable.dart';
import 'package:test_tiempo/Utils/utils.dart';

abstract class LanguageEvent extends Equatable {
  const LanguageEvent();
}

class LoadLanguageEvent extends LanguageEvent {

  final LanguageEnum language;
  const LoadLanguageEvent(this.language);

  @override
  List<Object> get props => [language];
}