import 'package:equatable/equatable.dart';

class WeatherUiState {
  String icon;
  String name;

  WeatherUiState({
    required this.icon,
    required this.name
  });

  factory WeatherUiState.fromJson(Map<String, dynamic> json) {
    int id = json['id'] ?? -1;
    String name = json['description'] ?? '';

    if (id == -1){
      return WeatherUiState(icon: '', name: '');
    }

    if (id >= 200 && id < 300){
      return WeatherUiState(
          icon: 'assets/icons/thunderstorm-showers.svg',
          name: name
      );
    }else if (id >= 300 && id < 400){
      return WeatherUiState(
          icon: 'assets/icons/heavy-showers.svg',
          name: name
      );
    }else if (id >= 500 && id < 600){
      return WeatherUiState(
          icon: 'assets/icons/showers.svg',
          name: name
      );
    }else if (id >= 600 && id < 700){
      return WeatherUiState(
          icon: 'assets/icons/heavy-snow.svg',
          name: name
      );
    }else if (id >= 700 && id < 800){
      return WeatherUiState(
          icon: 'assets/icons/windy.svg',
          name: name
      );
    }else if (id == 800 ){
      return WeatherUiState(
          icon: 'assets/icons/clear-day.svg',
          name: name
      );
    }else if (id > 800){
      return WeatherUiState(
          icon: 'assets/icons/cloudy.svg',
          name: name
      );
    }

    return WeatherUiState(
        icon: '',
        name: name
    );
  }


}

class WeatherData extends Equatable{

  List<WeatherDay> weatherDays;

  WeatherData({
    required this.weatherDays
  });

  factory WeatherData.fromJson(Map<String, dynamic> json) => WeatherData(
      weatherDays: (json['list'] as List).map((e) => WeatherDay.fromJson(e)).toList()
  );

  static final empty = WeatherData(
    weatherDays: const []
  );

  @override
  List<Object?> get props => [weatherDays];
}

class WeatherDay {

  DateTime? dateTime;
  int temperatureMin;
  int temperatureMax;
  WeatherUiState weatherUiState;

  WeatherDay({
    required int date,
    required this.temperatureMin,
    required this.temperatureMax,
    required this.weatherUiState
  }) {
    dateTime = _dateTimeFromEpochUs(date) ?? DateTime.now();
  }

  factory WeatherDay.fromJson(Map<String, dynamic> json) => WeatherDay(
    date: json['dt'],
    temperatureMin: double.parse(json['main']['temp_min'].toString()).floor(),
    temperatureMax: double.parse(json['main']['temp_max'].toString()).floor(),
    weatherUiState: WeatherUiState.fromJson((json['weather'] as List).first)
  );

  static DateTime? _dateTimeFromEpochUs(int? date) =>
      (date != null) ? DateTime.fromMillisecondsSinceEpoch(date * 1000) : null;
}