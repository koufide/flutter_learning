import 'package:fik_weather/features/weather/data/datasources/weather_remote_data_source.dart';
import 'package:fik_weather/features/weather/domain/entities/weather_entity.dart';
import 'package:fik_weather/features/weather/domain/repositories/weather_repository.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherRemoteDataSource remoteDataSource;

  WeatherRepositoryImpl( {required this.remoteDataSource});


  // @override
  // Future<Weather> getWeather() async {
  //   final weatherModel = await remoteDataSource.getWeatherForCity(cityName);
  //   return Weather(
  //     temperature: weatherModel.temperature,
  //     humidity: weatherModel.humidity,
  //   );
  // }

   @override
  Future<Weather> getWeatherForCity(String cityName) async {
     final data = await remoteDataSource.getWeatherForCity(cityName);
      return WeatherModel.fromJson(data);
  }


}