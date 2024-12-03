import 'package:fik_weather/core/error/failure.dart';
import 'package:fik_weather/core/usecases/usecase.dart';
import 'package:fik_weather/features/domain/entities/weather.dart';
import 'package:fik_weather/features/domain/repositories/weather_repository.dart';
import 'package:fik_weather/features/domain/usecases/no_params.dart';
import 'package:dartz/dartz.dart';

// class GetWeather implements UseCase<Weather, NoParams> {
//   final WeatherRepository repository;

//   GetWeather(this.repository);
  
//   @override
//   Future<Weather> call(NoParams params) async {
//     return await repository.getWeather();
//   }
  
// }

class GetWeather {
  final WeatherRepository repository;

  GetWeather(this.repository);

  Future<Either<Failure, Weather>> call(String cityName) async {
    return await repository.getWeatherForCity(cityName);
  }
}