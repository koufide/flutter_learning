import 'package:fik_weather/core/error/failure.dart';
import 'package:fik_weather/features/weather/domain/entities/weather_entity.dart';
import 'package:fik_weather/features/weather/domain/repositories/weather_repository.dart';
import 'package:dartz/dartz.dart';

// class GetWeather implements UseCase<Weather, NoParams> {
//   final WeatherRepository repository;

//   GetWeather(this.repository);
  
//   @override
//   Future<Weather> call(NoParams params) async {
//     return await repository.getWeather();
//   }
  
// }

class GetWeatherUseCase {
  final WeatherRepository repository;

  GetWeatherUseCase(this.repository);

  Future<Either<Failure, WeatherEntity>> call(String cityName) async {
    return await repository.getWeatherForCity(cityName);
  }
}