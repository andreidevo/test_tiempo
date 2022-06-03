import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_tiempo/blocs/weather/weather_event.dart';
import 'package:test_tiempo/blocs/weather/weather_state.dart';
import 'package:test_tiempo/resources/weather_repository.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState>{
  final WeatherRepository _weatherRepository;

  WeatherBloc(this._weatherRepository) : super(WeatherInitialState()){
    on<LoadWeatherEvent>((event, emit) async {
      emit(WeatherLoadingState(event.cityEnum));

      final weatherData = await _weatherRepository.getWeather(
        event.cityEnum,
        event.language
      );

      try {
        emit(WeatherLoadedState(weatherData, event.cityEnum, event.pickedDay));
      } catch (e) {
        emit(WeatherErrorState(e.toString()));
      }
    });
    on<ChangeWeatherDay>((event, emit) async {
      emit(WeatherLoadedState(
        event.weatherData,
        event.cityEnum,
        event.pickedDay
      ));
    });
  }
}