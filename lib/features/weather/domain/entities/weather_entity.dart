// class Weather {
//   final double temperature;
//   final double humidity;
  
//   Weather({required this.temperature, required this.humidity});
// }

import 'package:equatable/equatable.dart';

class WeatherEntity extends Equatable {
  final String cityName;
  final double temperature;
  final String description;

  const WeatherEntity({
    required this.cityName,
    required this.temperature,
    required this.description,
  });

   @override
  // List get props => [cityName, temperature, description, iconCode];
  List get props => [cityName, temperature, description];

}