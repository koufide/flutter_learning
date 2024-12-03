import 'package:fik_weather/features/domain/entities/weather.dart';

// abstract class WeatherState {}

// class WeatherInitial extends WeatherState {}
// class WeatherLoading extends WeatherState {}
// class WeatherLoaded extends WeatherState {
//   final Weather weather;

//   WeatherLoaded({required this.weather});

// }
// class WeatherError extends WeatherState {}


abstract class WeatherState {}

class WeatherInitial extends WeatherState {}
class WeatherLoading extends WeatherState {}
class WeatherLoaded extends WeatherState {
  final Weather weather;
  WeatherLoaded(this.weather);
}
class WeatherError extends WeatherState {
  final String message;
  WeatherError(this.message);
}

