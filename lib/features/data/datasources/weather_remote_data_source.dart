import 'dart:convert';

import 'package:fik_weather/core/error/failure.dart';
import 'package:fik_weather/features/data/models/weather_model.dart';
import 'package:http/http.dart' as http;

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
  Future<WeatherModel> getWeatherForCity(String cityName);
}

class WeatherRemoteDataSourceImpl implements WeatherRemoteDataSource {
  final http.Client client;
  final String apiKey = 'YOUR_API_KEY';

  WeatherRemoteDataSourceImpl(this.client);

  @override
  Future<WeatherModel> getWeatherForCity(String cityName) async {
    final response = await client.get(
      Uri.parse('https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey'),
    );

    if (response.statusCode == 200) {
      return WeatherModel.fromJson(json.decode(response.body));
    } else {
      throw const ServerFailure('Impossible de récupérer les données météo');
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