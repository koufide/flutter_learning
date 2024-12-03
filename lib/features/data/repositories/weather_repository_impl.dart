import 'package:fik_weather/features/data/datasources/weather_remote_data_source.dart';
import 'package:fik_weather/features/domain/entities/weather.dart';
import 'package:fik_weather/features/domain/repositories/weather_repository.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherRemoteDataSource remoteDataSource;

  WeatherRepositoryImpl( {required this.remoteDataSource});


  @override
  Future<Weather> getWeather() async {
    final weatherModel = await remoteDataSource.getWeatherForCity(cityName);
    return Weather(
      temperature: weatherModel.temperature,
      humidity: weatherModel.humidity,
    );
  }
}