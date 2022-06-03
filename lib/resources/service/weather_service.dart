import 'dart:async';
import 'package:dio/dio.dart';
import 'package:test_tiempo/Utils/utils.dart';
import 'package:test_tiempo/resources/models/weather_model.dart';

class WeatherRequestFailure implements Exception {}

class WeatherNotFoundFailure implements Exception {}

class WeatherClient {

  WeatherClient();

  static const _apiUrl = 'https://api.openweathermap.org/data/2.5/';
  static const _apiKey = '3576082f80c09dba5290cb7ec2eebebf';

  Future<WeatherData> getWeather({
      required double latitude,
      required double longitude,
      required String language,
      required CitiesEnum citiesEnum,
  }) async {
    final weatherResponse = await Dio().get(
      '${_apiUrl}forecast?lat=$latitude&lon=$longitude&appid=$_apiKey&lang=${language}&units=metric'
    );

    if (weatherResponse.statusCode != 200) {
      throw WeatherRequestFailure();
    }

    if (weatherResponse.data.isEmpty) {
      throw WeatherNotFoundFailure();
    }

    return WeatherData.fromJson(weatherResponse.data);
  }
}