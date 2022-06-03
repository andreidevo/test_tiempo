import 'package:equatable/equatable.dart';
import 'package:test_tiempo/Utils/utils.dart';
import 'package:test_tiempo/resources/models/weather_model.dart';

abstract class WeatherState extends Equatable {}

class WeatherInitialState extends WeatherState {
  final CitiesEnum weatherCity = CitiesEnum.london;
  final WeatherData weatherData = WeatherData(
      weatherDays: const []
  );
  final int pickedDay = 0;

  @override
  List<Object?> get props => [weatherCity, weatherData, pickedDay];
}

class WeatherLoadingState extends WeatherState {
  final CitiesEnum weatherCity;
  WeatherLoadingState(this.weatherCity);

  @override
  List<Object?> get props => [weatherCity];
}

class WeatherLoadedState extends WeatherState {
  final CitiesEnum weatherCity;
  final WeatherData weatherData;
  final int pickedDay;

  WeatherLoadedState(this.weatherData, this.weatherCity, this.pickedDay);

  @override
  List<Object?> get props => [weatherData, pickedDay];
}

class WeatherErrorState extends WeatherState {
  final String error;

  WeatherErrorState(this.error);

  @override
  List<Object?> get props => [error];
}