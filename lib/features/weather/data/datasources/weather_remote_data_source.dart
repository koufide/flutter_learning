import 'package:dartz/dartz.dart';
import 'package:fik_weather/core/error/failure.dart';
import 'package:fik_weather/features/weather/data/models/weather_model.dart';
import 'package:fik_weather/features/weather/domain/entities/weather_entity.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'dart:convert';

// abstract class WeatherRemoteDataSource {
//   Future<WeatherModel> getWeather();
// }

// class WeatherRemoteDataSourceImpl implements WeatherRemoteDataSource{
//   final http.Client client;

//   WeatherRemoteDataSourceImpl({required this.client});

//   @override
//   Future<WeatherModel> getWeather() async {
//     final response = await client.get(Uri.parse('https://api.weather.com'));

//     if (response.statusCode == 200) {
//       return WeatherModel.fromJson(jsonDecode(response.body));
//     }else{
//       throw Exception('Failed to load weather');
//     }
//   }

abstract class WeatherRemoteDataSource {
  // WeatherRemoteDataSource(Object object);
  WeatherRemoteDataSource();

  // Future<WeatherModel> getWeatherForCity(String cityName);
  // Future<Either> getWeatherForCity(String cityName);
  Future<Either<Failure, WeatherEntity>> getWeatherForCity(String cityName);
}

class WeatherRemoteDataSourceImpl implements WeatherRemoteDataSource {
  final http.Client client;
  final String apiKey = 'YOUR_API_KEY';
  // final Dio dio;

  // WeatherRemoteDataSourceImpl(this.client);
  // WeatherRemoteDataSourceImpl({required this.dio});
  // WeatherRemoteDataSourceImpl(this.dio);
  WeatherRemoteDataSourceImpl({http.Client? client})
      : client = client ?? http.Client();
  // @override
  // Future<WeatherModel> getWeatherForCity(String cityName) async {
  //   final response = await client.get(
  //     Uri.parse('https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey'),
  //   );

  //   if (response.statusCode == 200) {
  //     return WeatherModel.fromJson(json.decode(response.body));
  //   } else {
  //     throw const ServerFailure('Impossible de récupérer les données météo');
  //   }
  // }

  @override
  Future<Either<Failure, WeatherEntity>> getWeatherForCity(
      String cityName) async {
    try {
      // URL de l'API Open Meteo pour les coordonnées de Berlin comme exemple
      final url = Uri.parse(
          'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey');

      final response = await client.get(url);

      // final response = await dio.get(
      //   // 'https://api.open-meteo.com/v1/forecast',
      //   'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey',
      //   queryParameters: {
      //     'latitude': 52.52,
      //     'longitude': 13.41,
      //     'current_weather': true
      //   }
      // );

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = json.decode(response.body);

        final weatherData = jsonResponse['current_weather'];

        return Right(WeatherModel(
          cityName: cityName, // Utilisez le nom de ville passé en paramètre
          temperature: weatherData['temperature'].toDouble(),
          description: _getWeatherDescription(weatherData['weathercode']),
          // iconCode: _getWeatherIcon(weatherData['weathercode'])
        ));

        // final weatherData = response.data['current_weather'];

        // return Right(WeatherModel(
        //   cityName: cityName,
        //   temperature: weatherData['temperature'].toDouble(),
        //   description: 'Température actuelle',
        //   // iconCode: _getWeatherIcon(weatherData['weathercode'])
        // ));
      } else {
        return const Left(ServerFailure('Erreur de récupération des données'));
      }
    } catch (e) {
      // return const Left(NetworkFailure('Problème de connexion'));
      return Left(NetworkFailure('Erreur de connexion : ${e.toString()}'));
    }
  }

  // Méthode pour obtenir une description textuelle du code météo
  String _getWeatherDescription(int weatherCode) {
    switch (weatherCode) {
      case 0:
        return 'Ciel dégagé';
      case 1:
        return 'Principalement dégagé';
      case 2:
        return 'Partiellement nuageux';
      case 3:
        return 'Couvert';
      case 45:
      case 48:
        return 'Brouillard';
      case 51:
      case 53:
      case 55:
        return 'Bruine légère à modérée';
      case 61:
      case 63:
      case 65:
        return 'Pluie légère à modérée';
      case 71:
      case 73:
      case 75:
        return 'Chute de neige légère à modérée';
      default:
        return 'Conditions météorologiques inconnues';
    }
  }
}



  //https://geocoding-api.open-meteo.com/v1/search?name=abidjan&count=1
  /**
   * {
  "results": [
    {
      "id": 2293538,
      "name": "Abidjan",
      "latitude": 5.35444,
      "longitude": -4.00167,
      "elevation": 50.0,
      "feature_code": "PPLA",
      "country_code": "CI",
      "admin1_id": 11153151,
      "timezone": "Africa/Abidjan",
      "population": 3677115,
      "country_id": 2287781,
      "country": "Ivory Coast",
      "admin1": "Abidjan"
    }
  ],
  "generationtime_ms": 0.5450249
}
   */

  //https://api.open-meteo.com/v1/forecast?latitude=5.35444&longitude=-4.00167&current_weather=true
  /**
   * 
{
  "latitude": 5.375,
  "longitude": -4.0,
  "generationtime_ms": 0.054001808166503906,
  "utc_offset_seconds": 0,
  "timezone": "GMT",
  "timezone_abbreviation": "GMT",
  "elevation": 54.0,
  "current_weather_units": {
    "time": "iso8601",
    "interval": "seconds",
    "temperature": "°C",
    "windspeed": "km/h",
    "winddirection": "°",
    "is_day": "",
    "weathercode": "wmo code"
  },
  "current_weather": {
    "time": "2024-12-01T19:15",
    "interval": 900,
    "temperature": 27.8,
    "windspeed": 8.2,
    "winddirection": 195,
    "is_day": 0,
    "weathercode": 1
  }
   */


// }