import 'package:equatable/equatable.dart';
import 'package:test_tiempo/Utils/utils.dart';
import 'package:test_tiempo/resources/models/weather_model.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();
}

class LoadWeatherEvent extends WeatherEvent {
  final CitiesEnum cityEnum;
  final String language;
  final int pickedDay;
  const LoadWeatherEvent(this.cityEnum, this.language, this.pickedDay);

  @override
  List<Object> get props => [cityEnum, language];
}

class ChangeWeatherDay extends WeatherEvent{
  final CitiesEnum cityEnum;
  final WeatherData weatherData;
  final int pickedDay;
  const ChangeWeatherDay(this.cityEnum, this.weatherData, this.pickedDay);

  @override
  List<Object> get props => [cityEnum, weatherData, pickedDay];
}