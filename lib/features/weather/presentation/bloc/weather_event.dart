import 'package:equatable/equatable.dart';
// abstract class WeatherEvent {}

// class FetchWeather extends WeatherEvent {}

abstract class WeatherEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchWeather extends WeatherEvent {
  final String cityName;
  FetchWeather(this.cityName);

   @override
  List<Object> get props => [cityName];
}