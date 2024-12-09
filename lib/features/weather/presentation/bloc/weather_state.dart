import 'package:equatable/equatable.dart';
import 'package:fik_weather/features/weather/domain/entities/weather_entity.dart';

// abstract class WeatherState {}

// class WeatherInitial extends WeatherState {}
// class WeatherLoading extends WeatherState {}
// class WeatherLoaded extends WeatherState {
//   final Weather weather;

//   WeatherLoaded({required this.weather});

// }
// class WeatherError extends WeatherState {}


abstract class WeatherState extends Equatable {
  @override
  List<Object> get props => [];
}

class WeatherInitial extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherLoaded extends WeatherState {
  final WeatherEntity weather;

  WeatherLoaded(this.weather);

  @override
  List<Object> get props => [weather];
}

class WeatherError extends WeatherState {
  final String message;
  
  WeatherError(this.message);

   @override
  List<Object> get props => [message];

}

