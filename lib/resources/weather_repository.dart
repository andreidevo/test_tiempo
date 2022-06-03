import 'dart:async';
import 'package:test_tiempo/Utils/utils.dart';
import 'package:test_tiempo/resources/models/weather_model.dart';
import 'package:test_tiempo/resources/service/weather_service.dart';

class WeatherFailure implements Exception {}

class WeatherRepository {
  WeatherRepository({WeatherClient? weatherApiClient})
      : _weatherClient = weatherApiClient ?? WeatherClient();

  final WeatherClient _weatherClient;

  Future<WeatherData> getWeather(CitiesEnum city, String language) async {

    final weatherFetch = await _weatherClient.getWeather(
      latitude: Utils().getCoordinatesCity(city: city).first,
      longitude: Utils().getCoordinatesCity(city: city).last,
      language: language,
      citiesEnum: city
    );

    WeatherData weather = WeatherData(
      weatherDays: []
    );

    for (int i = 0; i < weatherFetch.weatherDays.length; i+=8){
      weather.weatherDays.add(weatherFetch.weatherDays[i]);
    }

    return weather;
  }
}
