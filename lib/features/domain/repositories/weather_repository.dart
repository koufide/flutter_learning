
// import 'package:fik_weather/features/domain/entities/weather.dart';

// abstract class WeatherRepository {
//   Future<Weather> getWeather();
// }


import 'package:dartz/dartz.dart';
import 'package:fik_weather/core/error/failure.dart';
import 'package:fik_weather/features/domain/entities/weather.dart';
// import '../../../../core/error/failures.dart';
// import '../entities/weather.dart';

abstract class WeatherRepository {
  Future<Either<Failure, Weather>> getWeatherForCity(String cityName);
}